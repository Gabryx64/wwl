ifeq ($(strip $(PVSNESLIB_HOME)),)

ifeq ($(OS),Windows_NT)
	$(error "Please ensure pvsneslib is installed and create the
					 environment variable PVSNESLIB_HOME with path to its
					 folder and restart the application. (you can do it on
					 either by using the Windows GUI or from the terminal
					 by executing the command <setx PVSNESLIB_HOME "path/to/snesdev">)")
else
	$(error "Please ensure pvsneslib is installed and create the environment
					 variable PVSNESLIB_HOME with path to its folder and restart the
					 application. (you can do it from the terminal by executing the
					 command <export PVSNESLIB_HOME="path/to/snesdev">)")
endif

endif

include ${PVSNESLIB_HOME}/devkitsnes/snes_rules

CFLAGS += -Iinclude

export ROMNAME=wwl

.PHONY: all clean run

all: assets/sprites.pic assets/bg.pic $(ROMNAME).sfc

%.pic: %.bmp
	# No

assets/sprites.pic: assets/sprites.png
	$(GFXCONV) -gs16 -pc16 -po16 -n -fpng -m $<


assets/bg.pic: assets/bg.png
	$(GFXCONV) -gs8 -pc256 -pe0 -n -fpng -m $<


run: all 
	bsnes $(ROMNAME).sfc

clean: cleanBuildRes cleanRom cleanGfx
	$(RM) assets/*.pic assets/*.pal assets/*.map
