--# -path=.:../Common:prelude:present

concrete MiniSystemMMSpa of MiniSystem = GodisSystemMMSpa ** MiniSystemMMI with 
    (MiniSystemI=MiniSystemSpa), (Grammar=GrammarSpa);

