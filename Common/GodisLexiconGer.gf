--# -path=.:prelude:present

concrete GodisLexiconGer of GodisLexicon = CatGer ** 
    open GodisResource, Prelude, GrammarGer, ParadigmsGer, (M=MorphoGer), ParamX in {

lin

you_NP = UsePron youPol_Pron;
i_NP   = UsePron i_Pron;

userGreet = strUtt ["hallo"];
userQuit  = strUtt ["tschüß"];
userNo    = strUtt ["nein"];
userYes   = strUtt ["ja"];
userOkay  = strUtt ["okay"];
userPardon = variants{ strUtt "pardon"; strUtt "was" };

userCoordinate = strUtt ("und" ++ optStr "dann");

which_IP = whatSg_IP ;

}
