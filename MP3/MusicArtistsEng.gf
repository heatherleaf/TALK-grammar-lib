--# -path=.:../Common:prelude:alltenses

concrete MusicArtistsEng of MusicArtists = open Prelude, CatEng, GodisLangEng in {

lincat Artist = NP;

lin

-- Swedish
-- The english Nuance TTS can't pronounce anything useful of swedish names.
-- The empty variants guarantees that the concrete grammar fulfills the abstract syntax
-- without yielding any linearizations.   
abba = plur_NP ["abba"];
adolphson_och_falk = plur_NP ["adolphson and falk"];
anne_lie_ryde = variants{}; -- ["anne-lie rydÅÈ"];
bo_kaspers_orkester = variants{}; -- ["bo kasper's orchestra"];
christer_sandelin = variants{}; -- ["christer sandelin"];
dan_hylander_och_rmb = variants{}; -- variants { ["dan hylander"]; ["dan hylander and raj montana band"]};
di_leva = variants{}; -- variants { ["tomas di leva"]; ["di leva"] };
dilba = plur_NP ["dilba"];
docent_dod = variants{}; -- ["docent dead"];
dr_alban = sing_NP ["doctor alban"];
ebba_gron = variants{}; -- ["ebba green"];
eldkvarn = variants{}; -- ["eldkvarn"];
eric_gadd = variants{}; -- ["eric gadd"];
eva_dahlgren = variants{}; -- ["eva dahlgren"];
freda = variants{}; -- ["freda"];
gyllene_tider = variants{}; -- ["gyllene tider"];
imperiet = variants{}; -- ["imperiet"];
irma = variants{}; -- ["irma"];
jakob_hellman = variants{}; -- ["jakob hellman"];
jumper = plur_NP ["jumper"];
kent = plur_NP ["kent"];
lars_winnerback = variants{}; -- ["lars winnerbÅ‰ck"];
lisa_ekdahl = variants{}; -- ["lisa ekdahl"];
lisa_nilsson = variants{}; -- ["lisa nilsson"];
lolita_pop = variants{}; -- ["lolita pop"];
lustans_lakejer = variants{}; -- ["lustans lakejer"];
marie_fredriksson = variants{}; -- ["marie fredriksson"];
mauro_scocco = variants{}; --  ["mauro scocco"];
mikael_rickfors = variants{}; --  ["mikael rickfors"];
mikael_wiehe = variants{}; --  ["mikael wiehe"];
monica_tornell = variants{}; --  ["monica tÅˆrnell"];
nordman = variants{}; --  ["nordman"];
norum_och_nilsson = variants{}; --  ["norum och nilsson"];
orup = variants{}; --  ["orup"];
patrik_isaksson = variants{}; --  ["patrik isaksson"];
peter_lemarc = variants{}; --  ["peter lemarc"];
petter = variants{}; --  ["petter"];
peps_persson = variants{}; --  ["peps persson"];
ratata = plur_NP ["ratata"];
robyn = sing_NP ["robyn"];
roger_pontare = variants{}; --  ["roger pontare"];
roxette = plur_NP ["roxette"];
staffan_hellstrand = variants{}; --  ["staffan hellstrand"];
stakka_bo = variants{}; --  ["stakka_bo"];
stefan_andersson = variants{}; --  ["stefan andersson"];
stina_nordenstam = variants{}; --  ["stina nordenstam"];
tomas_ledin = variants{}; --  ["tomas ledin"];
ulf_lundell = variants{}; --  ["ulf lundell"];
uno_svenningsson = variants{}; --  ["uno svenningsson"];
viba_femba = variants{}; --  ["viba femba"];

-- Artists using English pronounciation
arctic_monkeys = plur_NP (variants { ["arctic monkeys"]; ["the arctic monkeys"] });
beatles = plur_NP ["the beatles"];
beborn_beton = plur_NP ["beborn beton"];
billy_idol = sing_NP ["billy idol"];
britney_spears = sing_NP ["britney spears"];
clash = plur_NP (variants {["the clash"]; ["clash"] });
covenant = plur_NP ["covenant"];
cure = plur_NP ( variants { ["the cure"]; ["cure"] });
dolly_parton = sing_NP ["dolly parton"];
elvis_presley = sing_NP ["elvis presley"];
enigma = plur_NP ["enigma"];
enya = sing_NP ["enya"];
fergie = sing_NP ["fergie"];
fifty_cent = sing_NP ["fifty cent"];
garbage = plur_NP ["garbage"];
green_day = plur_NP ["green day"];
god_speed_black_emperor = plur_NP ["god speed you black emperor"];
jam = plur_NP ( variants { ["the jam"]; ["jam"]});
justin_timberlake = sing_NP ["justin timberlake"];
kate_bush = sing_NP ["kate bush"];
lee_morgan = sing_NP ["lee morgan"];
madonna = sing_NP ["madonna"];
marvin_gaye = sing_NP ["marvin gaye"];
massive_attack = plur_NP ["massive attack"];
michael_jackson = sing_NP ["michael jackson"];
morlocks = plur_NP ( variants { ["the morlocks"]; ["morlocks"] });
morrisey = sing_NP ["morrisey"];
mr_vegas = sing_NP ["mr vegas"];
mudhoney = plur_NP ["mudhoney"];
nitzer_ebb = plur_NP ["nitzer ebb"];
pain = plur_NP ["pain"];
pet_shop_boys = plur_NP (variants {["the pet shop boys"]; ["pet shop boys"]});
pink_floyd = plur_NP ["pink floyd"];
pixies = plur_NP ( variants { ["the pixies"];["pixies"] } );
prodigy = plur_NP ( optStr ["the"] ++ ["prodigy"]);
project_pitchfork = plur_NP ["project pitchfork"];
red_hot_chili_peppers = plur_NP ( optStr ["the"] ++["red hot chili peppers"]);
rolling_stones = plur_NP ( optStr ["the"] ++ [" rolling stones"]);
shakira = sing_NP ["shakira"];
usher = plur_NP ["usher"];
vnv_nation = plur_NP ["vnv nation"];

shania_twain = sing_NP ["shania twain"];
trace_adkins = sing_NP ["trace adkins"];
chemical_brothers = plur_NP (variants { ["the chemical brothers"]; ["chemical brothers"]});
eminem = sing_NP ["eminem"];
ozzy_osbourne = sing_NP ["ozzy osbourne"];
norah_jones = sing_NP ["norah jones"];
jessica_simpson = sing_NP ["jessica simpson"];
guns_and_roses = plur_NP ( optStr ["the"] ++ [" guns and roses"]);
europe = plur_NP (optStr ["the"] ++ ["europe"]);
led_zeppelin = plur_NP ( optStr ["the"] ++ ["led zeppelin"]);
cardigans = plur_NP ( optStr ["the"] ++ ["cardigans"]);
ace_of_base = plur_NP ( optStr ["the"] ++ ["ace of base"]);
atomic_swing = plur_NP ( optStr ["the"] ++ ["atomic swing"]);
jessica_simpson = sing_NP ["jessica simpson"];
creeps = plur_NP ( optStr ["the"] ++ [" creeps"]);
eagle_eye_cherry = sing_NP ["eagle eye cherry"];
stephen_simmonds = sing_NP ["stephen simmonds"];
ark = plur_NP ( variants { ["the ark"]; ["ark"] });
trance_dance = plur_NP ["trance dance"];
vacuum = plur_NP ["vacuum"];

}
