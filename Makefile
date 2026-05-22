BOARD ?= tangnano9k
BITSTREAM ?= impl/pnr/tang_nano_9k.fs

.PHONY: clean flash

clean:
	rm -rf impl
	rm -f *.log *.rpt *.jou *.tmp

flash:
	openFPGALoader -b $(BOARD) $(BITSTREAM)
