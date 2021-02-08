# -*- coding: utf-8 -*-
# perl
# get web page content
# When connecting to servers with default SNI configuration
# the OCS does not check the hostname after the TLS negotiation
# certificate will be of the requested site and content from the host 
# defined after the negotiation 
# 
# 1: TCP handshake (ip)
# 2: TLS handshake ( check cert with hostname) 
# 3: Data exchange ( new get request with hostname <> original TLS hostname) 
 
# usage getit2.pl https://requested_site https://host_after_sni
# perl getit2.pl www.crimesite.nl https://www.schuldenaanpak.b

use strict;
use LWP::UserAgent;
my ($sni, $snitbc) = @ARGV;

my $header = ['Host' => $sni];

my $ua = new LWP::UserAgent;
$ua->timeout(120);
my $request = new HTTP::Request('GET', $snitbc, $header);
my $response = $ua->request($request);
my $content = $response->content();
print $content;
