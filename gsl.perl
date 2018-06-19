
$argv = join ":", @ARGV;
die "Usage: perl gsl.perl (Agenda|MP3|Delux|Tram) (Present|Single)* usermodule lng ... \n"
  unless $argv =~ /^(Agenda | MP3 | Delux | Tram) :
                    ((Present | Single) :)* \w+ (: \w\w\w)+$/x;

$dom = shift;
$dir = $dom;

while ($ARGV[0] =~ /^(Present|Single)$/) {
  $flag = shift;
  $$flag = $flag;
}

$usrmod = shift;
@lngs   = @ARGV;
$opts   = "-s -nocf -optimize=share_subs";
$pre    = "-preproc=./mk" . $Present . $Single . "Unimodal";

print "! rm -f $dir/*.gfc $dir/*.gfr Common/*.gfc Common/*.gfr \n";

for $lng (@lngs) {
  $gram = $dom . $usrmod . $lng;
  print <<XXX;
! echo '== Creating GSL for $gram'
e
i $opts $pre $dir/$gram.gf
s
pg -printer=gsl | wf output/$gram.gsl
XXX
}

