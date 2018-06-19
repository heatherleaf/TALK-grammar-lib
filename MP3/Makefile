
LANGS  = Eng Swe
CONCRS = $(LANGS) Sem
MODS   = System SystemMM Delux

GF       = gf +RTS -M1000M -K100M -RTS
JAVAOPTS = -nocf -optimize=share -path=.:../Common:../DeLux:prelude:alltenses
GSLOPTS  = $(JAVAOPTS) -preproc=../mkUnimodal

OUT = ../output


.PHONY: all clean java nuance

all: clean java nuance

java: cleanPreproc
	@for mod in $(MODS) ; \
	do echo "s ;; pm -utf8 -utf8id -printer=header | wf $(OUT)/MP3$$mod.gfcm ;;" \
	         "pm -utf8 -utf8id -printer=cfgm | wf $(OUT)/MP3$$mod.cfgm" | \
	   $(GF) $(JAVAOPTS) $(CONCRS:%=MP3$${mod}%.gf) ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/MP3$$mod.gfcm" ; \
	   echo "-- Grammar created: $(OUT)/MP3$$mod.cfgm" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done

nuance: cleanPreproc
	@for lng in $(LANGS) ; \
	do echo "s ;; pg -printer=gsl | wf $(OUT)/MP3Delux$$lng.gsl" | \
	   $(GF) $(GSLOPTS) MP3Delux$$lng.gf ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/MP3Delux$$lng.gsl" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done


clean: 
	rm -f $(OUT)/MP3*

cleanPreproc:
	rm -f ../Common/GodisApp.gfc ../Common/GodisApp.gfr ../Common/GodisMM.gfc ./Common/GodisMM.gfr

