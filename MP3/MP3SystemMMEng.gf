--# -path=.:../Common:prelude:alltenses

concrete MP3SystemMMEng of MP3System =
    GodisSystemMMEng, MusicMMEng ** MP3SystemMMI with
    (MP3SystemI=MP3SystemEng);

