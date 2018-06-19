#/usr/bin/perl

%DOMS = (Delux => "DeLux",
	 MP3   => "MP3",
	 Tram  => "Tram");

%MODS = (# Delux => "DeluxSystem Lamps Rooms Socket",
	 Delux => "",
	 MP3   => "",
	 # MP3   => "MP3System Music MusicSongs MusicArtists",
	 Tram  => "");

@langs = ("Eng", "Swe");

%lincat = ("Lamps" => "N", "Rooms" => "N", "Socket" => "CN");

die "Usage: perl combineMM.perl domain" unless $#ARGV==0;

$dom = shift;
$dir = $DOMS{$dom};

die "Usage: perl combineMM.perl (".join(" | ",keys %DOMS).")" unless $dir;

push @langs, "Fin", "Fre", "Ger", "Ita", "Spa" if $dom eq "Tram";


for $inmodule (split / /, $MODS{$dom}) {

  $autogen = "-- DO NOT EDIT THIS FILE!!!\n-- This file was automatically generated by $0\n" .
    "-- from $inmodule.gf\n-- " . localtime();

  for $lng (@langs) {
    $outmodule = $inmodule . "MM" . $lng;
    print "    $inmodule  -->  $outmodule\n";

    $text = $inmodule . $lng;
    $sem  = $inmodule . "Sem";
    $OPEN = "(Text=$text), (Sem=$sem), (MM=GodisMM), (Cat=Cat$lng)";

    $lin = 0;
    open IN, "< $dir/$inmodule.gf";
    open OUT, "> $dir/$outmodule.gf";
    print OUT "--# -path=.:../Common:prelude:alltenses\n\n$autogen\n\n";
    while (<IN>) {
      next if /^--# -path=/;

      if (/^\s*abstract\s+$inmodule\s*=\s*(.*?)\s*(\*\*)?\s*\{/) {
	@mods = split /\s*,\s*/, $1;
	$ending = /\}\s*$/;
	$_ = "concrete $outmodule of $inmodule =\n";
	$_ .= "\t" . join(", ", map{$_."MM".$lng} @mods) . " **\n" if @mods;
	$_ .= "\topen $OPEN in {";
	$_ .= "}" if $ending;
      }

      $lin = 1 if s/^\s*fun\b/lin/;
      $lin = 0 if s/^\s*cat\b/lincat/;

      if (!/^\s*--/) {
	if (!$lin) {
	  $lc = $lincat{$inmodule};
	  $lc = "NP" unless $lc;
	  s/^\s*lincat\s+(\w+)\s*;/lincat $1 = MM.Semantics ** Cat.$lc;/;
	} elsif (/^\s*(\w+)\s*:\s*(.+?)\s*;/) {
	  $fun = $1;
	  @type = split /\s*->\s*/, $2;
	  $args = join " ", map {"x$_"} 1..$#type;
	  $semargs = join " ", map {"x$_.sem"} 1..$#type;
	  $_ = "$fun $args = Text.$fun $args ** MM.sem (Sem.$fun $semargs)";

	  # special hack for propositions
	  if ($type[$#type] eq "Proposition") {
	    if ($#type == 1) {
	      $_ .= " ** MM.shortForm (Text.shortAns (Text." . lc($type[0]) . " x1)) (x1.sem);\n";
	    } else {
	      $_ .= " ** MM.longForm;\n";
	    }
	  } else {
	    $_ .= ";\n";
	  }
	}
      }

      print OUT;
    }
    close IN;
    close OUT;
  }
}


