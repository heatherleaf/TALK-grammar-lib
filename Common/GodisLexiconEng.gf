--# -path=.:prelude:present

concrete GodisLexiconEng of GodisLexicon = CatEng ** 
    open GodisResource, Prelude, GrammarEng, ParadigmsEng, (M=MorphoEng), ParamX in {

lin

you_NP = UsePron youSg_Pron;
i_NP   = M.mkNP "i" "me""my" Sg P1 ** {lock_NP = <>};

userGreet  = strUtt ["hello"];
userQuit   = strUtt (variants{["goodbye"];["quit"]});
userNo     = strUtt ["no"];
userYes    = strUtt ["yes"];
userOkay   = strUtt (variants{["okay"];["o k"]});
userPardon = strUtt (variants{"pardon";"sorry";"what"});

userCoordinate = strUtt ("and" ++ optStr "then");

which_IP = whatSg_IP ;

}
