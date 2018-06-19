
LANGS  = Eng Swe
CONCRS = $(LANGS) Sem
MODS   = System SystemMM MP3

GF       = gf +RTS -M1000M -K100M -RTS
JAVAOPTS = -nocf -optimize=share -path=.:../Common:../MP3:prelude:alltenses
GSLOPTS  = $(JAVAOPTS) -preproc=../mkUnimodal

OUT = ../output


.PHONY: all java nuance clean cleanPreproc

all: clean java nuance

java: cleanPreproc
	@for mod in $(MODS) ; \
	do echo "s ;; pm -utf8 -utf8id -printer=header | wf $(OUT)/Delux$$mod.gfcm ;;" \
	         "pm -utf8 -utf8id -printer=cfgm | wf $(OUT)/Delux$$mod.cfgm" | \
	   $(GF) $(JAVAOPTS) $(CONCRS:%=Delux$${mod}%.gf) ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/Delux$$mod.gfcm" ; \
	   echo "-- Grammar created: $(OUT)/Delux$$mod.cfgm" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done

nuance: cleanPreproc
	@for lng in $(LANGS) ; \
	do echo "s ;; pg -printer=gsl | wf $(OUT)/DeluxMP3$$lng.gsl" | \
	   $(GF) $(GSLOPTS) DeluxMP3$$lng.gf ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/DeluxMP3$$lng.gsl" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done


clean: 
	rm -f $(OUT)/Delux*

cleanPreproc:
	rm -f ../Common/GodisApp.gfc ../Common/GodisApp.gfr ../Common/GodisMM.gfc ./Common/GodisMM.gfr

