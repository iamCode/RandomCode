##
# Id: filename.rb $
##

##
# This file is part of the Metasploit Framework and may be subject to
# redistribution and commercial restrictions. Please see the Metasploit
# Framework web site for more information on licensing and terms of use.
# http://metasploit.com/framework/
##

require 'msf/core'

class Metasploit3 < Msf::Exploit::Remote
	Rank = AverageRanking

	include Msf::Exploit::Remote::Tcp

	def initialize(info = {})
		super(update_info(info,
			'Name'           => 'Name of module',
			'Description'    => %q{
				Description here...

			},
			'Author'         =>
				[
					'Rapid7',
					'etc...'
				],
			'References'     =>
				[
					['CVE', 'CVE details here'],
					['BID', ''],
					['URL', '']
				],
			'DefaultOptions' =>
				{
					'EXITFUNC' => 'process',
				},
			'Payload'        =>
				{
					'Space'           => ,
					'BadChars'        => "\x00\x0a\x0d",
					'StackAdjustment' => ,
				},
			'Platform'       => 'win',
			'Targets'        =>
				[
					
					[ '',      { 'Ret' => 0x } ]

				],
			
			'DefaultTarget'  => 0,
			'Privileged'     => false,
			'DisclosureDate' => ''))

		register_options(
			[
				Opt::RPORT(69),
			], self.class)
	end

	def exploit
	
	##  Exploit code

	end

end
