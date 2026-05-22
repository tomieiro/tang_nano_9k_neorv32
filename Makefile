BOARD ?= tangnano9k
BITSTREAM ?= impl/pnr/tang_nano_9k.fs
GOWIN ?= gw_sh
PROJECT ?= tang_nano_9k.gprj
QT_QPA_PLATFORM ?= minimal

.PHONY: clean build flash

build:
	QT_QPA_PLATFORM=$(QT_QPA_PLATFORM) $(GOWIN) build.tcl

flash:
	openFPGALoader -b $(BOARD) -f $(BITSTREAM)

clean:
	rm -rf impl
	rm -f *.log *.rpt *.jou *.tmp
