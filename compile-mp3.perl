


$argv = join " ", @ARGV;

die "Usage: perl compile.perl (Agenda|MP3|Delux|Tram) (Single|Unimodal|Present)* lng ... \n"
  unless $argv =~ /^(Agenda|MP3|Delux|Tram) (mk\w+|\.) (mk\w+|\.) (\w+ )+\w\w\w$/;

$dom = "MP3";
$dir = $dom;

$usrmod  = "User";
@sysmods = qw/System SystemMM/;
@lngs    = qw/Swe Eng/;

$opts  = "-s -nocf -optimize=share_subs";
$clean = "! rm -f $dir/*.gfc $dir/*.gfr Common/*.gfc Common/*.gfr \n";

$preGFCM = "mkSingleApp";
$preGSL  = "mkSingleUnimodal";

print "! rm -f output/$dom* \n";

# GFCM + CFGM

$pre = $preGFCM eq "." ? "" : "-preproc=./$preGFCM";
print $clean;
for $mod (($usrmod, @sysmods)) {
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

$pre = $preGSL eq "." ? "" : "-preproc=./$preGSL";
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

