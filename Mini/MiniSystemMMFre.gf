--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMFre of MiniSystem = GodisSystemMMFre ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemFre), (Grammar=GrammarFre);

