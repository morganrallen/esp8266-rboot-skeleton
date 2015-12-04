#
# Makefile for all buildable projects, inc. esptool2 and rBoot
# https://github.com/raburton/esp8266
#
# This parent Makefile configures environment variables in one place, using
# sub-make to pass settings to each component. You can also build components
# individually, but be sure to modify paths in each respective Makefile to
# match your environment.

# Rules:
# `all`	 compile esptool2 and copy it to the project bin dir, compile rboot,
#				 compile rboot-sampleproject (which automatically copies required
#				 headers and source files from rBoot)
# `clean` run clean on esptool2, rboot, and rboot-sampleproject with inherited
#				 configuration

RABURTON_BASE ?= $(abspath raburton)
ESPTOOL2      ?= $(abspath ${RABURTON_BASE}/esptool2/esptool2)
SDK_BASE      ?= esp_iot_sdk_v1.4.0/
RBOOT_INC     ?= -I${RABURTON_BASE}/rboot/appcode -I${RABURTON_BASE}/rboot-sampleproject -I${RABURTON_BASE}/rboot
RBOOT_LIBDIR     ?= ${RABURTON_BASE}/rboot-sampleproject/build

XTENSA_BINDIR ?= $(shell dirname -- `which xtensa-lx106-elf-gcc`)


CC = xtensa-lx106-elf-gcc
LD = xtensa-lx106-elf-gcc

# turn relative into aboslute before proceeding
SDK_BASE := $(abspath ${SDK_BASE})

$(info XTENSA_BINDIR = ${XTENSA_BINDIR});
$(info RABURTON_BASE = ${RABURTON_BASE});
$(info ESPTOOL2 = ${ESPTOOL2});
$(info SDK_BASE = ${SDK_BASE});
$(info )

export

.PHONY: all raburton rboot-app clean

all: raburton rboot-app

raburton:
	@$(MAKE) -C raburton

rboot-app:
	@echo "Building rBoot main project"
	@$(MAKE) -C src/

clean:
	@$(MAKE) -C ${RABURTON_BASE}/esptool2 clean
	@$(MAKE) -C ${RABURTON_BASE}/rboot clean
	@$(MAKE) -C ${RABURTON_BASE}/rboot-sampleproject clean
