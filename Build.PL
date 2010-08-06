{ use 5.011002; }
use warnings;
use strict;

use Module::Build;

Module::Build->new(
	module_name => "Devel::EvalFragment",
	dist_version => "0.000",
	license => "perl",
	configure_requires => {
		"Module::Build" => 0,
		"perl" => "5.011002",
	},
	build_requires => {
		"ExtUtils::CBuilder" => "0.15",
		"Module::Build" => 0,
		"Test::More" => 0,
		"perl" => "5.011002",
		"strict" => 0,
		"warnings" => 0,
	},
	requires => {
		"B::Hooks::EndOfScope" => "0.05",
		"XSLoader" => 0,
		"perl" => "5.011002",
		"strict" => 0,
		"warnings" => 0,
	},
	dynamic_config => 0,
	meta_add => { distribution_type => "module" },
	create_makefile_pl => "passthrough",
	sign => 1,
)->create_build_script;

1;
