--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMSwe of MiniSystem = GodisSystemMMSwe ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemSwe), (Grammar=GrammarSwe);

