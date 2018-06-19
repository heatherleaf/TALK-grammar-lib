--# -path=.:../Common:prelude:alltenses

concrete MusicSongsEng of MusicSongs = open Prelude, CatEng, GodisLangEng in {

lincat Song = NP;

lin

-- Swedish titles
-- The english Nuance TTS can't pronounce anything useful of swedish names.
-- The empty variants guarantees that the concrete grammar fulfills the abstract syntax
-- without yielding any linearizations.
blinkar_bla = variants{}; --  ["blinkar bl�"];
segla_pa_ett_moln = variants{}; --  ["segla p� ett moln"];
undantag = variants{}; --  ["undantag"];
det_hon_vill_ha = variants{}; --  ["det hon vill ha"];
skuggor_i_skymningen = variants{}; --  ["skuggor i skymningen"];
vem_ska_jag_tro_pa = variants{}; --  ["vem ska jag tro p�"];
solglasogon = variants{}; --  ["solglas�gon"];
atta_hundra_grader = variants{}; --  ["�tta hundra grader"];
karlekens_tunga = variants{}; --  ["k�rlekens tunga"];
angeln_i_rummet = variants{}; --  ["�ngeln i rummet"];
vem_tander_stjarnorna = variants{}; --  ["vem t�nder stj�rnorna"];
vindarna = variants{}; --  ["vindarna"];
flickorna_pa_tv_tva = variants{}; --  ["flickorna p� t v tv�"];
du_ska_va_president = variants{}; --  ["du ska va president"];
precis_som_du = variants{}; --  ["precis som du"];
vara_vanner = variants{}; --  ["vara v�nner"];
om_du_var_har = variants{}; --  ["om du var h�r"];
kom_ihag_mig = variants{}; --  ["kom ih�g mig"];
vem_vet = variants{}; --  ["vem vet"];
himlen_runt_hornet = variants{}; --  ["himlen runt h�rnet"];
diamanter = variants{}; --  ["diamanter"];
efter_stormen = variants{}; --  ["efter stormen"];
det_finns = variants{}; --  ["det finns"];
sarah = sing_NP ["sarah"];
vingar = variants{}; --  ["vingar"];
flickan_och_krakan = variants{}; --  ["flickan och kr�kan"];
vintersaga = variants{}; --  ["vintersaga"];
allt_som_jag_kanner = variants{}; --  ["allt som jag k�nner"];
jag_blir_hellre_jagad_av_vargar = variants{}; --  ["jag blir hellre jagad av vargar"];
du_far_gora_som_du_vill = variants{}; --  ["du f�r g�ra som du vill"];
hall_om_mig = variants{}; --  ["h�ll om mig"];
sag_som_det_ar = variants{}; --  ["s�g som det �r"];
vinden_har_vant = variants{}; --  ["vinden har v�nt"];
jackie = sing_NP ["jackie"];
lilla_fagel_bla = variants{}; --  ["lilla f�gel bl�"];
sommaren_ar_kort = variants{}; --  ["sommaren �r kort"];
en_del_av_mitt_hjarta = variants{}; --  ["en del av mitt hj�rta"];
oppna_landskap = variants{}; --  ["�ppna landskap"];
under_ytan = variants{}; --  ["under ytan"];
teknikens_under = variants{}; --  ["teknikens under"];
tva_av_oss = variants{}; --  ["tv� av oss"];
vandraren = variants{}; --  ["vandraren"];
under_norrskenet = variants{}; --  ["under norrskenet"];
vill_ha_mer = variants{}; --  ["vill ha mer"];
flykting = variants{}; --  ["flykting"];
sanningens_krigare = variants{}; --  ["sanningens krigare"];
i_vargens_spar = variants{}; --  ["i vargens sp�r"];
nu_tandas_tusen_julejus = variants{}; --  ["nu t�ndas tusen julejus"];
alla_alskar_dig = variants{}; --  ["alla �lskar dig"];
hon_far = variants{}; --  ["hon f�r"];

-- English titles
another_world = sing_NP ["another world"];
deeper_than_the_usual_feeling = sing_NP ["deeper than the usual feeling"];
london_calling = sing_NP ["london calling"];
should_i_stay_or_should_i_go = sing_NP ["should i stay or should i go"];
dead_stars = sing_NP ["dead stars"];
like_tears_in_rain = sing_NP ["like tears in rain"];
figurehead = sing_NP ["figurehead"];
final_countdown = sing_NP ["final countdown"];
leviathan = sing_NP ["leviathan"];
stalker = sing_NP ["stalker"];
friday_im_in_love = sing_NP ["friday im in love"];
sadness = sing_NP ["sadness"];
i_think_im_paranoid = sing_NP ["i think im paranoid"];
in_the_city = sing_NP ["in the city"];
time_for_truth = sing_NP ["time for truth"];
the_man_with_the_child_in_his_eyes = sing_NP ["the man with the child in his eyes"];
totem_pole = sing_NP ["totem pole"];
lucky_star = sing_NP ["lucky star"];
material_girl = sing_NP ["material girl"];
if_i_should_die_tonight = sing_NP ["if i should die tonight"];
angel = sing_NP ["angel"];
teardrop = sing_NP ["teardrop"];
sly = sing_NP ["sly"];
sex_by_force = sing_NP ["sex by force"];
ars_magica = sing_NP ["ars magica"];
razors_through_flesh = sing_NP ["razors through flesh"];
heads_high = sing_NP ["heads high"];
latest_news = sing_NP ["latest news"];
good_enough = sing_NP ["good enough"];
thorn = sing_NP ["thorn"];
let_beauty_loose = sing_NP ["let beauty loose"];
eleanor_rigby = sing_NP ["eleanor rigby"];
west_end_girls = sing_NP ["west end girls"];
suburbia = sing_NP ["suburbia"];
debaser = sing_NP ["debaser"];
poison = sing_NP ["poison"];
existence = sing_NP ["existence"];
darkangel = sing_NP ["darkangel"];
rubicon = sing_NP ["rubicon"];
all_that_she_wants = sing_NP ["all that she wants"];
the_final_countdown = sing_NP (variants{["the final countdown"]; ["final countdown"]});
stone_me_into_the_groove = sing_NP ["stone me into the groove"];
oh_i_like_it = sing_NP ["oh i like it"];
save_tonight = sing_NP ["save tonight"];
tears_never_dry = sing_NP ["tears never dry"];
it_takes_a_fool_to_remain_sain = sing_NP ["it takes a fool to remain sane"];
youre_gonna_get_it = sing_NP ["youre gonna get it"];
i_breathe = sing_NP ["i breathe"];
legion = sing_NP ["legion"];
standing = sing_NP ["standing"];
like_a_prayer = sing_NP ["like a prayer"];

}
