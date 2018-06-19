--# -path=.:prelude:present

concrete GodisLexiconIta of GodisLexicon = CatIta ** 
    open GodisResource, Prelude, GrammarIta, ParadigmsIta, (M=MorphoIta), ParamX in {

lin

you_NP = UsePron youPol_Pron;
i_NP   = UsePron i_Pron;

userGreet  = strUtt ["buongiorno"];
userQuit   = strUtt (variants{ ["arrivederci"]; ["basta così"] });
userNo     = strUtt ["no"];
userYes    = strUtt ["sì"];
userOkay   = strUtt ["va bene"];
userPardon = strUtt ["scusi"];

userCoordinate = strUtt ("e" ++ optStr "poi");

which_IP = {
  s = \\c => M.prepCase c ++ ["quale"] ; a = M.aagr masculine singular
  } ;

}
