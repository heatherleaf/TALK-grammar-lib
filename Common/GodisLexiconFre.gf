--# -path=.:prelude:present

concrete GodisLexiconFre of GodisLexicon = CatFre ** 
    open GodisResource, Prelude, GrammarFre, ParadigmsFre, (M=MorphoFre), ParamX in {

lin

you_NP = UsePron youPol_Pron;
i_NP   = UsePron i_Pron;

userGreet  = strUtt ["bonjour"];
userQuit   = strUtt (variants{ ["au revoir"]; ["c'est tout"] });
userNo     = strUtt ["non"];
userYes    = strUtt ["oui"];
userOkay   = strUtt ["d'accord"];
userPardon = strUtt ["pardon"];

userCoordinate = strUtt ("et" ++ optStr "ensuite");

which_IP = whatSg_IP ;

}
