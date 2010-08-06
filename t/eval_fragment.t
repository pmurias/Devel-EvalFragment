use v5.10;
use Scope::Escape::Sugar;
use B::Hooks::EndOfScope;
use Test::More;

my ($flag1,$flag2);
sub eval_fragment {
    my ($code) = @_;
    eval("{BEGIN {B::Hooks::EndOfScope::on_scope_end { Scope::Escape::Sugar::stop_the_parse()}}\n".$code);
    die if $@;
}
sub line {
    my ($file,$sub,$line) = caller(0);
    $line;
}

eval_fragment('$flag1 = 42}');
is $flag1,42,'evaling code works';
eval_fragment(q[$flag2 = 66};fail("the parse isn't stopped")]);
is $flag2,66,"the code after the } brace doesn't get run";

done_testing;
