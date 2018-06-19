
$argv = join ":", @ARGV;
die "Usage: perl gfcm.perl (Agenda|MP3|Delux|Tram) (Present|Single|Unimodal)* usermodule lng ... \n"
  unless $argv =~ /^(Agenda | MP3 | Delux | Tram) :
                    ((Present | Single | Unimodal) :)* \w+ (: \w\w\w)+$/x;

$dom = shift;
$dir = $dom;

while ($ARGV[0] =~ /^(Present|Single|Unimodal)$/) {
  $flag = shift;
  $$flag = $flag;
}

$usrmod = shift;
@mods   = ("System", $Unimodal ? () : ("SystemMM"));
@langs  = @ARGV;
$pre    = $Present . $Single . $Unimodal;
$pre    = $pre ?"-preproc=./mk$pre" : "";
$opts   = "-s -nocf -optimize=share_subs";

print "! rm -f $dir/*.gfc $dir/*.gfr Common/*.gfc Common/*.gfr \n";
print "! rm -f output/temp-* \n";

######################################################################
# system modules

for $mod (@mods) {
  $gram = $dom . $mod;
  print "! echo '== Creating GFCM+CFGM for $gram' \n";
  for $lng (@langs) {
    print <<XXX;
e
i $opts $pre $dir/$gram$lng.gf
s
pm -printer=gfcm | wf output/temp-$gram$lng.gfcm
XXX
  }

  print "e \n";
  for $lng (@langs) {
    print "i output/temp-$gram$lng.gfcm \n";
  }
  print <<XXX;
pm -utf8 -utf8id -printer=header | wf output/$gram.gfcm
e
i $opts $pre $dir/${gram}Sem.gf
s
pm -utf8 -utf8id -printer=cfgm | wf output/$gram.cfgm
XXX
}

######################################################################
# the user module

$gram = $dom . $usrmod;
for $lng (@langs) {
  print <<XXX;
e
i $opts $dir/$gram$lng.gf
s
pm -printer=gfcm | wf output/temp-$gram$lng.gfcm
XXX
}

print "e \n";
for $lng (@langs) {
  print "i output/temp-$gram$lng.gfcm \n";
}
print <<XXX;
pm -utf8 -utf8id -printer=cfgm | wf output/$gram.cfgm
e
i $opts $dir/${gram}Sem.gf
s
pm -utf8 -utf8id -printer=header | wf output/$gram.gfcm
XXX

