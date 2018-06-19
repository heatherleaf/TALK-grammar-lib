
$STAT = "stat.tmp";
system "rm -f $STAT";
system "rm -f output/Tram*";

$OPTS = "-s -eval -nocf -optimize=none_subs -path=Tram:Common:prelude:present";
$GF = "gf -s +RTS -M3000M -K100M -RTS";

foreach $lng (qw/Ita/) { #Sem Eng Swe Ger Ita Fre Spa Fin/) {
  foreach $mod (qw/User System SystemMM/) {
    system "rm -f Tram/*.gfc Tram/*.gfr Common/*.gfc Common/*.gfr";
    $gram = "Tram$mod$lng";
    print "-- $gram\n";
    system "echo '-------------------------' >> $STAT";
    system "echo '-- $gram.gfcm/cfgm' >> $STAT";
    system "echo '' >> $STAT";
    open GF, "| $GF >> $STAT";
    print GF "i $OPTS Tram/$gram.gf \n";
    print GF "s \n";
    print GF "pm -printer=header | wf output/$gram.gfcm \n";
    print GF "pm -printer=cfgm | wf output/Tram$mod$lng.cfgm \n";
    close GF;
    system "echo '' >> $STAT";
  }

  foreach $mod (qw/User/) {
    system "rm -f Tram/*.gfc Tram/*.gfr Common/*.gfc Common/*.gfr";
    $gram = "Tram$mod$lng";
    print "-- $gram\n";
    system "echo '-------------------------' >> $STAT";
    system "echo '-- $gram.gsl' >> $STAT";
    system "echo '' >> $STAT";
    open GF, "| $GF >> $STAT";
    print GF "i $OPTS -preproc=./mkUnimodal Tram/$gram.gf \n";
    print GF "s \n";
    print GF "pg -printer=gsl | wf output/$gram.gsl \n";
    close GF;
    system "echo '' >> $STAT";
  }
}



