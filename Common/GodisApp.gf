

resource GodisApp = open Prolog in {

oper

App : Type = {app : Str};
app : Str -> App = \s -> {app = s};

anyApp : App = app "godis";

applyApp : (App ** PStr) -> PStr = \x -> 
    prefixBracketApp x.app  --# multiapp
    x;

prefixBracketApp : Str -> PStr -> PStr = \a,x ->
    pOper ":" (pp0 a) (pBrackets x);

}
