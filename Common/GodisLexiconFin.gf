--# -path=.:prelude:present

concrete GodisLexiconFin of GodisLexicon = CatFin ** 
    open GodisResource, Prelude, GrammarFin, ParadigmsFin, (M=MorphoFin), ParamX in {

lin

you_NP = UsePron youPol_Pron;
i_NP   = UsePron i_Pron;

userGreet = strUtt ["hei"];
userQuit  = strUtt (variants{ ["n�kemiin"]; ["lopetetaan"] });
userNo    = strUtt ["ei"];
userYes   = strUtt ["kyll�"];
userOkay  = variants { strUtt ["okei"]; strUtt ["selv�"] };
userPardon = variants{ strUtt "anteeksi" };

userCoordinate = strUtt ("ja" ++ optStr "sitten");

which_IP = whatSg_IP ;

}
