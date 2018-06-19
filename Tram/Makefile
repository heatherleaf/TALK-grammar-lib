
LANGS  = Eng Swe Ger Fre Ita Spa # Fin Fre Ger Ita Spa
CONCRS = $(LANGS) Sem
MODS   = System SystemMM User

GF       = gf +RTS -M1000M -K100M -RTS
JAVAOPTS = -nocf -optimize=share -path=.:../Common:prelude:present
GSLOPTS  = $(JAVAOPTS) -preproc=../mkUnimodal

OUT = ../output


.PHONY: all clean java nuance

all: clean java nuance

java: cleanPreproc
	@for mod in $(MODS) ; \
	do echo "s ;; pm -utf8 -utf8id -printer=header | wf $(OUT)/Tram$$mod.gfcm ;;" \
	         "pm -utf8 -utf8id -printer=cfgm | wf $(OUT)/Tram$$mod.cfgm" | \
	   $(GF) $(JAVAOPTS) $(CONCRS:%=Tram$${mod}%.gf) ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/Tram$$mod.gfcm" ; \
	   echo "-- Grammar created: $(OUT)/Tram$$mod.cfgm" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done

nuance: cleanPreproc
	@for lng in $(LANGS) ; \
	do echo "s ;; pg -printer=gsl | wf $(OUT)/TramUser$$lng.gsl" | \
	   $(GF) $(GSLOPTS) TramUser$$lng.gf ; \
	   echo ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo "-- Grammar created: $(OUT)/TramUser$$lng.gsl" ; \
	   echo "----------------------------------------------------------------------" ; \
	   echo ; \
	done


clean: 
	rm -f $(OUT)/Tram*

cleanPreproc:
	rm -f ../Common/GodisApp.gfc ../Common/GodisApp.gfr ../Common/GodisMM.gfc ./Common/GodisMM.gfr

