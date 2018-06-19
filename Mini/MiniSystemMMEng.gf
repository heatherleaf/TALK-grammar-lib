--# -path=.:../Common:prelude:alltenses

concrete MiniSystemMMEng of MiniSystem = GodisSystemMMEng ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemEng), (Grammar=GrammarEng);

