
GFCM = gfcm.perl
GSL  = gsl.perl
GF   = gf -s +RTS -M1000M -RTS

.PHONY: help all MP3 Delux DeluxMP3 Tram Agenda

help: 
	@echo "Usage: make (Agenda | Tram | Delux | MP3 | DeluxMP3)"

all: Tram Delux MP3 DeluxMP3 Agenda

Agenda: 
	@perl $(GSL) Agenda Single User Eng Swe | $(GF)

Tram: 
	@perl $(GFCM) Tram Present Single User Eng Swe Ger Ita Fre Spa Fin | $(GF)
	@perl $(GSL) Tram Present Single User Eng Swe Ger Ita Fre Spa Fin | $(GF)

Delux: 
	@perl $(GFCM) Delux Single User Eng Swe | $(GF)
	@perl $(GSL) Delux Single User Eng Swe | $(GF)

MP3: 
	@perl $(GFCM) MP3 Single User Eng Swe | $(GF)
	@perl $(GSL) MP3 Single User Eng Swe | $(GF)

DeluxMP3: 
	@perl $(GFCM) Delux MP3 Eng Swe | $(GF)
	@perl $(GFCM) MP3 Delux Eng Swe | $(GF)
	@perl $(GSL) Delux MP3 Eng Swe | $(GF)
	@perl $(GSL) MP3 Delux Eng Swe | $(GF)

