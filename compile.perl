
$argv = join ":", @ARGV;
die "Usage: perl compile.perl (Agenda|MP3|Delux|Tram) (Single|Unimodal|Present)* usermodule lng ... \n"
  unless $argv =~ /^(Agenda | MP3 | Delux | Tram) :
                    ((Single | Unimodal | Present) :)* \w+ (: \w\w\w)+$/x;

$dom = shift;
$dir = $dom;

while ($ARGV[0] =~ /^(Single|Unimodal|Present)$/) {
  $flag = shift;
  $$flag = $flag;
}

$usrmod = shift;
@mods   = ($usrmod, "System", $Unimodal ? () : ("SystemMM"));
@lngs   = @ARGV;

$preGFCM = $Present . $Single . $Unimodal;
$preGSL  = $Present . $Single . "Unimodal";

$opts  = "-s -nocf -optimize=share_subs";
$clean = "! rm -f $dir/*.gfc $dir/*.gfr Common/*.gfc Common/*.gfr \n";
print "! rm -f output/$dom* \n";

# GFCM + CFGM

$pre = $preGFCM ?"-preproc=./mk$preGFCM" : "";
print $clean;
for $mod (@mods) {
  $gram = $dom . $mod;
  print "! echo '== Creating GFCM+CFGM for $gram' \n";
  for $lng (("Sem", @lngs)) {
    print "i $opts $pre $dir/$gram$lng.gf \n";
  }
  print <<XXX;
s
pm -printer=header | wf output/$gram.gfcm
pm -printer=cfgm   | wf output/$gram.cfgm
XXX
}

# GSL

$pre = $preGSL ?"-preproc=./mk$preGSL" : "";
print $clean;
$gram = $dom . $usrmod;
for $lng (@lngs) {
  print <<XXX;
! echo '== Creating GSL for $gram$lng'
e
i $opts $pre $dir/$gram$lng.gf
s
pg -printer=gsl | wf output/$gram$lng.gsl
XXX
}

