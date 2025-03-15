#
# copied from Chocolatey(https://chocolatey.org/install) install 
# 
#   choco install make
# 
# C:\ProgramData\chocolatey\lib\make\tools\install\bin\make.exe <-- copied this one
# its a recent make 4.4.1
# 
# make -f makefile.gnu CONFIG=debug ASSEMBLER=tasmbox
#

include my_helper.mk

# options
CONFIG ?= release
ASSEMBLER ?= tasm32
LINKER ?= tlink

VALID_CONFIGS = debug release

VALID_ASSEMBLERS = tasmbox tasmx tasm32

BORLAND_LINKERS = tlinkbox tlink
VALID_LINKERS = $(BORLAND_LINKERS) wlink

# valid CONFIG
ifeq (,$(findstring $(CONFIG),$(VALID_CONFIGS)))
  $(error unknown CONFIG value: $(CONFIG))
endif

# valid ASSEMBLER
ifeq (,$(findstring $(ASSEMBLER),$(VALID_ASSEMBLERS)))
  $(error unknown ASSEMBLER value: $(ASSEMBLER))
endif

# valid LINKER
ifeq (,$(findstring $(LINKER),$(VALID_LINKERS)))
  $(error unknown LINKER value: $(LINKER))
endif

# valid option combination
ifeq ($(CONFIG),debug)
  ifeq ($(ASSEMBLER),tasm32)
    $(error ASSEMBLER $(ASSEMBLER) is not supported for CONFIG $(CONFIG))
  endif
  ifeq ($(LINKER),wlink)
    $(error LINKER $(LINKER) is not supported for CONFIG $(CONFIG))
  endif
endif

MAKE_PARAMS = CONFIG=$(CONFIG) ASSEMBLER=$(ASSEMBLER) LINKER=$(LINKER)

all: restunts

asm: force_me
	make -C asm -f makefile.gnu $(MAKE_PARAMS)

c: force_me
	make -C c -f makefile.gnu $(MAKE_PARAMS)

restunts: asm c
	make -C dos -f makefile.gnu $(MAKE_PARAMS)

clean:
	make -C asm -f makefile.gnu $(MAKE_PARAMS) clean
	make -C c -f makefile.gnu $(MAKE_PARAMS) clean
	make -C dos -f makefile.gnu $(MAKE_PARAMS) clean

# i have no idea why i need to force pre-targets with an empty target
force_me: ;
