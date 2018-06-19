--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMGer of MiniSystem = GodisSystemMMGer ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemGer), (Grammar=GrammarGer);

