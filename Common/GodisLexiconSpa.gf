--# -path=.:prelude:present

concrete GodisLexiconSpa of GodisLexicon = CatSpa ** 
    open GodisResource, Prelude, GrammarSpa, ParadigmsSpa, (M=MorphoSpa), ParamX in {

lin

you_NP = UsePron youPol_Pron;
i_NP   = UsePron i_Pron;

{- Rebeccas yttranden:
userGreet = "hola"
userQuit = "adiós" / "hasta luego" / "salir"
userOkay = "vale"
userPardon = "cómo"
-}

userGreet = strUtt ["hola"];
userQuit  = strUtt (variants{ ["hasta luego"]; ["hasta la vista"] });
userNo    = strUtt ["no"];
userYes   = strUtt ["si"];
userOkay  = strUtt ["de acuerdo"]; -- ["muy bien"];
userPardon = variants{ strUtt "pardon"; strUtt "que" };

userCoordinate = strUtt ("e" ++ optStr "poi");

which_IP = whatSg_IP ;

}
