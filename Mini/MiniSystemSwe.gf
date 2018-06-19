--# -path=.:../Common:prelude:alltenses

concrete MiniSystemSwe of MiniSystem = GodisSystemSwe ** 
    MiniSystemI with (Lang=LangSwe);

