--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMFin of MiniSystem = GodisSystemMMFin ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemFin), (Grammar=GrammarFin);

