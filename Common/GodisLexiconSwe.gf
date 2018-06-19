--# -path=.:prelude:present

concrete GodisLexiconSwe of GodisLexicon = CatSwe ** 
    open GodisResource, Prelude, GrammarSwe, ParadigmsSwe, (M=MorphoSwe), ParamX in {

lin

you_NP = UsePron youSg_Pron;
i_NP   = UsePron i_Pron;

userGreet  = strUtt ["hej"];
userQuit   = strUtt ["hejd�"];
userNo     = strUtt ["nej"];
userYes    = strUtt ["ja"];
userOkay   = strUtt (variants{["okej"];["o k"]});
userPardon = strUtt (variants{"urs�kta";"va"});

userCoordinate = strUtt ("och");

which_IP = whatSg_IP ;

}
