#!/usr/bin/perl

use warnings;
use strict;
use Time::HiRes qw(gettimeofday usleep);

use Env qw(@HOSTNAME);

my $cmd;
my $d1;
my $out;
my $t0;
my $t1;



while(1) {
  ($t0,$t1) = gettimeofday();
  $d1 = 1000000 - $t1;
  print "t: $t0, going to sleep for $d1 usecs\n";
  usleep($d1);
  $cmd = "/usr/local/bin/periodic-ingest.sh  | /usr/local/bin/ingest.pl";
  $out = `$cmd`;
  print "out: $out\n";
}

exit(0);
