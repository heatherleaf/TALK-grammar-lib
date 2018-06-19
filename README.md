
The TALK GF/GoDiS Grammar Library
=================================

This README was originally written 15 December 2006.

Important note, 19 June 2018
------------------------------

This repository was uploaded to Github 19 June 2018.

The repository has not changed since 2006, but Grammatical Framework has changed a lot. So there are no guarantees whatsoever that these grammars can be compiled by GF off the shelf. 

The grammars are described in the following project deliverables:

  - Ljunglöf et al. *Multimodal Grammar Library*. TALK Project deliverable D1.2b, 2006.
  - Ljunglöf et al. *Enhanced Multimodal Grammar Library*. TALK Project deliverable D1.5, 2006.

Both deliverables can be found here: <http://www.cse.chalmers.se/~peb/bibliography.html> 

Layout of the library
---------------------

There are five directories in the library, one with application-independent grammars, and one for each of the four applications:

  - `Common`: contains grammars common to all applications
  - `Agenda`: contains application-specific grammars for AgendaTALK
  - `Delux`:  contains application-specific grammars for GoDiS DeLux
  - `MP3`:    contains application-specific grammars for DJ GoDiS
  - `Tram`:   contains application-specific grammars for GoTGoDiS

Instructions for use
--------------------

1. Install GF (follow instructions in the GF distribution)

2. Set (and export) the shell variable GF_LIB_PATH to the path .../GF/lib

3. Build the present and alltenses directories from the Resource Library:
  
        $ cd .../GF/lib/resource-1.0
        $ make present
        $ make alltenses

4. Start compiling grammars:

        $ make (Agenda | Tram | Delux | MP3 | DeluxMP3)

Note that all resulting grammars (`.gfcm`, `.cfgm`, and `.gsl`) are placed in the directory `output`




