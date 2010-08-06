=head1 NAME

Devel::EvalFragment - eval perl fragments till }

=head1 SYNOPSIS


=head1 DESCRIPTION


=cut

package Devel::EvalFragment;

{ use 5.011002; }
use warnings;
use strict;

use B::Hooks::EndOfScope 0.05 ();

our $VERSION = "0.000";

require XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);


sub import {
}


=head1 SEE ALSO


=head1 AUTHOR

Paweł Murias <pawelmurias@gmail.com>

=head1 COPYRIGHT

Copyright (C) 2010 Paweł Murias  <pawelmurias@gmail.com>

=head1 LICENSE

This module is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
