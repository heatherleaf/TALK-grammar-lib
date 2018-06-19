#/usr/bin/perl

if (@ARGV[0] eq "-trace") {
  shift;
  $GFCMD = ">&STDOUT";
} else {
  $GFCMD = "| gf +RTS -M1000M -K100M";
  # $GFCMD = "| gf +RTS -M1000M -K100M | perl -ne 'next if / wrote file |[\+\|] reading /; print \"\n\" if /^- compiling/; print'";
}

die "Usage: perl make.perl domain" unless $#ARGV==0;

$dom = shift;

@langs      = ("Eng", "Swe");
@sysmods    = ("System", "SystemMM");
@usrmods    = ("User");
@multimodal = ($dom);

$javaopts   = "";
$nuanceopts = "-preproc=./mkUnimodal";
$dir = $dom;

$cleanPreproc = "rm -f Common/GodisApp.gfc Common/GodisApp.gfr Common/GodisMM.gfc Common/GodisMM.gfr";

if ($dom eq "Agenda") {
  $javaopts = $nuanceopts = "-preproc=./mkSingleUnimodal";
  @sysmods = ("System");
  @multimodal = ();

} elsif ($dom eq "Delux") {
  $dir = "DeLux";
  push @multimodal, "MP3";
  @usrmods = ("MP3");

} elsif ($dom eq "MP3") {
  push @multimodal, "Delux";
  @usrmods = ("Delux");

} elsif ($dom eq "Tram") {
  push @langs, "Ger", "Spa"; # "Ita", "Fre", "Fin";
  $javaopts   .= " -path=Tram:Common:prelude:present";
  $nuanceopts .= " -path=Tram:Common:prelude:present";

} else {
  die "Usage: perl make.perl (Agenda|Delux|MP3|Tram)";
}

@concrs = ("Sem", @langs);
@mods   = (@sysmods, @usrmods);

$output = "output";
system "mkdir -p $output";

print "**********************************************************************\n";
print "** Current domain: $dom\n\n";

if ($#multimodal >= 0) {
  print "** Autogenerating grammars\n";
  for $mm (@multimodal) {
    print "perl combineMM.perl $mm\n";
    system "perl combineMM.perl $mm";
  }
}

print "\n\n** Do you want to create (J)ava grammars, (N)uance grammars, or (B)oth?\n";
$answer = <STDIN>;

# java
if ($answer =~ /^\s*[jb]\s*$/i) {
  system $cleanPreproc;
  open GF, $GFCMD;
  for $mod (@mods) {
    $base = $dom . $mod;
    print GF "e\n";
    for $lng (@concrs) {
      print GF "i -nocf -optimize=share $javaopts $dir/" .
	($mod.$lng eq "SystemMMSem" ? $dom."SystemSem.gf\n" : "$base$lng.gf\n");
    }
    print GF "s\n";
    print GF "pm -utf8 -utf8id -printer=header | wf $output/$base.gfcm\n";
    print GF "pm -utf8 -utf8id -printer=cfgm | wf $output/$base.cfgm\n";
    open PROP, "> $output/$base.properties\n";
    print PROP <<XXX;
name: $base
gfcm: $base.gfcm
cfgm: $base.cfgm
unlexer = se.chalmers.cs.gf.linearize.unlex.TextUnlexer
XXX
  }
  close GF;
  print "\n\n** Java grammars created:\n";
  print "   $output/$dom\{" . join(",",@mods) . "\}.\{gfcm,cfgm,properties\}\n\n";
  print "**********************************************************************\n";
}

# nuance
if ($answer =~ /^\s*[nb]\s*$/i) {
  system $cleanPreproc;
  open GF, $GFCMD;
  for $mod (@usrmods) {
    print GF "e\n";
    for $lng (@langs) {
      $base = $dom . $mod . $lng;
      print GF "i -nocf -optimize=share $nuanceopts $dir/$base.gf\n";
      print GF "s\n";
      print GF "pg -lang=$base -printer=gsl | wf $output/$base.gsl\n";
    }
  }
  close GF;
  print "\n\n** Nuance grammars created:\n";
  print "   $output/$dom\{" . join(",",@usrmods) . "\}\{" . join(",",@langs) ."\}.gsl\n\n";
  print "**********************************************************************\n";
}

system $cleanPreproc;

print "\n\nThank you for using this script.\n";
