--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMIta of MiniSystem = GodisSystemMMIta ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemIta), (Grammar=GrammarIta);

