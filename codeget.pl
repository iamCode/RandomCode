#!/usr/bin/perl -w

use strict;
use HTTP::Request;
use LWP::UserAgent;
use Getopt::Std;

my ($target, %options);

my %hosts = (
	"pastebin"	=>	"http://pastebin.com/download.php?i=",
	"edb"		=>	"http://www.exploit-db.com/download/",
	"pastebay"	=>	"http://www.pastebay.net/pastebay.php?dl=" );

getopts("t:i:o:h", \%options);
if ($options{h}) {
	print q{[*] Hosts:
	pastebin	pastebin.com
	edb		exploit-db.com
	pastebay	pastebay.net
};
	exit 1;
} elsif (!defined($options{t}) || (!defined($options{i})) || (!defined($options{o}))) {
	die "[!] Usage: ./pasteget -t [HOST] -i [ID] -o [SAVE AS]\n";
}

my $id = $options{i};
my $file = $options{o};

if ($options{t} =~ m/pastebin/) {
	$target = $hosts{pastebin};
} elsif ($options{t} =~ m/edb/) {
	$target = $hosts{edb};
} elsif ($options{t} =~ m/pastebay/) {
	$target = $hosts{pastebay};
}

my $url = $target . $id;
print "[*] Connecting to $url...\n";
my $request = HTTP::Request -> new(GET=>$url);
my $useragent = LWP::UserAgent -> new();
my $response = $useragent -> request($request);

if ($response->is_success) {
	print "[>] Downloading...\n";
	system ("wget -q -O $file $url");
	print "[+] Done\n";
} else {
	print "[!] Connection error. Some sites block LWP requests. You can abort, or continue [y/n]: ";
	chomp (my $cont = <STDIN>);
	if ($cont =~ /y/) {
		print "[>!] Continuing...\n";
		system ("wget -q -O $file $url");
		print "[+] Done\n";
	} else {
		exit 1;
	}
}
