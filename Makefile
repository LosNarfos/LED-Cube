# based on a Makefile by https://github.com/thomask77

# Optimization level, can be [0, 1, 2, 3, s]. 
#     0 = turn off optimization. s = optimize for size.
# 

OPT = 0

# directories
#
OUT_DIR = debug

SRC_DIR = src
INC_DIR = inc
LIB_DIR = lib
OBJ_DIR = $(OUT_DIR)/obj
BIN_DIR = $(OUT_DIR)/bin
DOC_DIR = $(OUT_DIR)/doc
DEP_DIR	= $(OUT_DIR)/dep
LST_DIR = $(OUT_DIR)/lst

# Target file name (without extension)
#
TARGET = $(OUT_DIR)/FirstTest

# used board (for openocd)
#
DONGLE = board/stm32f4discovery.cfg

# Define all C source files (dependencies are generated automatically)
#
#SOURCES = $(wildcard $(SRC_DIR)/*.c) $(wildcard */*.c)
SOURCES += $(wildcard $(SRC_DIR)/CMSIS/*.s)
SOURCES += $(wildcard $(SRC_DIR)/CMSIS/*.c)
SOURCES += $(wildcard $(SRC_DIR)/*.s)
SOURCES += $(wildcard $(SRC_DIR)/*.c)
TMP += $(SOURCES:src/%=%)

# Define all object files from c-files
#
#OBJECTS = $(addprefix $(OBJ_DIR)/,$(addsuffix .o,$(notdir $(basename $(TMP)))))
OBJECTS = $(addsuffix .o, $(addprefix $(OBJ_DIR)/,$(basename $(TMP))))
#OBJECTS = $(basename $(TMP))
#OBJECTS = $(addsuffix .o, $(notdir $(basename $(SOURCES))))

# Place -D, -U or -I options here for C and C++ sources
#
CPPFLAGS += -I$(SRC_DIR)
CPPFLAGS += -I$(INC_DIR)
CPPFLAGS += -I$(INC_DIR)/CMSIS
CPPFLAGS += -I$(LIB_DIR)

#---------------- Compiler Options C ----------------
#  -g*:          generate debugging information
#  -O*:          optimization level
#  -f...:        tuning, see GCC documentation
#  -Wall...:     warning level
#  -Wa,...:      tell GCC to pass this to the assembler.
#    -adhlns...: create assembler listing

CFLAGS  = -O$(OPT)
CFLAGS += -std=gnu99
CFLAGS += -gdwarf-2
CFLAGS += -ffunction-sections
CFLAGS += -fdata-sections
CFLAGS += -Wall
CFLAGS += -Wa,-adhlns=$(LST_DIR)/$(*F).lst

# Optimize use of the single-precision FPU
#
CFLAGS += -fsingle-precision-constant

# This will not work without recompiling libs
#
# CFLAGS += -fshort-double

#---------------- Assembler Options ----------------
#  -Wa,...:   tell GCC to pass this to the assembler
#  -adhlns:   create listing
#
ASFLAGS = -Wa,-adhlns=$(LST_DIR)/$(*F).lst


#---------------- Linker Options ----------------
#  -Wl,...:     tell GCC to pass this to linker
#    -Map:      create map file
#    --cref:    add cross reference to  map file
LDFLAGS += -lm
LDFLAGS += -Wl,-Map=$(TARGET).map,--cref
LDFLAGS += -Wl,--gc-sections
#LDFLAGS += -Tsrc/stm32_flash.ld
LDFLAGS += -Tsrc/CMSIS/STM32F407VGTx_FLASH.ld

#============================================================================


# Define programs and commands
TOOLCHAIN = arm-none-eabi
CC        = $(TOOLCHAIN)-gcc
OBJCOPY   = $(TOOLCHAIN)-objcopy
OBJDUMP   = $(TOOLCHAIN)-objdump
SIZE      = $(TOOLCHAIN)-size
NM        = $(TOOLCHAIN)-nm
OPENOCD   = openocd -f $(DONGLE)
#STLINK   = 

# Compiler flags to generate dependency files
GENDEPFLAGS = -MMD -MP -MF $(DEP_DIR)/$(*F).d


# Combine all necessary flags and optional flags
# Add target processor to flags.
#
CPU = -mcpu=cortex-m4 -mthumb -mfloat-abi=softfp -mfpu=fpv4-sp-d16

CFLAGS   += $(CPU)
CXXFLAGS += $(CPU)
ASFLAGS  += $(CPU)
LDFLAGS  += $(CPU)

# Default target.
all:  build showsize

help:
	@echo "--------- Directories*-----------"
	@echo "SRC_DIR = $(SRC_DIR)"
	@echo "OBJ_DIR = $(OBJ_DIR)"
	@echo "------------Files ---------------"
	@echo "SOURCES = $(SOURCES)"
	@echo "OBJECTS = $(OBJECTS)"	
	@echo "-----------Flags-----------------"
	@echo "CFLAGS = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"

build: elf hex bin lss sym

elf: $(TARGET).elf
hex: $(TARGET).hex
bin: $(TARGET).bin
lss: $(TARGET).lss
sym: $(TARGET).sym


# Display compiler version information
gccversion: 
	@$(CC) --version

# Show the final program size
showsize: elf
	@echo ---------------------------------------------------------------------
	@$(SIZE) $(TARGET).elf

# Target: clean project
clean:
	@echo Cleaning project:
	rm -fr $(OUT_DIR)

connect:
	$(shell $(OPENOCD))

# Listing of phony targets
.PHONY: all build clean elf lss sym showsize gccversion connect

# Create bin file from ELF output file.
%.bin: %.elf
	@echo Creating bin file: $@
	@$(OBJCOPY) -O binary $< $@

# Create hex file from ELF output file.
%.hex: %.elf
	@echo Creating hex file: $@
	@$(OBJCOPY) -O ihex $< $@

# Create extended listing file from ELF output file
%.lss: %.elf
	@echo Creating Extended Listing: $@
	@$(OBJDUMP) -h -S -z $< > $@

# Create a symbol table from ELF output file 	
%.sym: %.elf
	@echo Creating Symbol Table: $@
	@$(NM) -n $< > $@

# Link: create ELF output file from object files
$(TARGET).elf: $(OBJECTS)
	@echo Linking: $@
	@$(CC) $^ $(LDFLAGS) --output $@ 

# Compile: create object files from C source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo Compiling C: $<
	@$(CC) -c $(CPPFLAGS) $(CFLAGS) $(GENDEPFLAGS) $< -o $@

# Assemble: create object files from assembler source files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@echo Assembling : $<
	@$(CC) -c $(CPPFLAGS) $(ASFLAGS) $< -o $@
	

-include $(wildcard $(DEP_DIR)/*.d)

# Create object file directories
$(shell mkdir -p $(OUT_DIR) 2>/dev/null)
$(shell mkdir -p $(OBJ_DIR) 2>/dev/null)
$(shell mkdir -p $(DEP_DIR) 2>/dev/null)
$(shell mkdir -p $(LST_DIR) 2>/dev/null)
$(shell mkdir -p $(OBJ_DIR)/CMSIS 2>/dev/null)

