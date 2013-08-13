#!/usr/bin/perl
$n = 16;
if( $#ARGV  > -1 ){ #reads in $n
    $n = $ARGV[0];
}
$weights = "~/reg/gauss-laguerre_weights";
$abscissae = "~/reg/gauss-laguerre_abscissae";
$weights_link = $weights.".txt";
$weights_n = $weights.$n.".txt";
$abscissae_link = $abscissae.".txt";
$abscissae_n = $abscissae.$n.".txt";
system( "rm -f $weights_link $abscissae_link" );
system( "ln -s $weights_n $weights_link" );
system( "ln -s $abscissae_n $abscissae_link" );
