use v5.10;
use Devel::EvalFragment qw(eval_fragment);
use B::Hooks::EndOfScope;
use Test::More;
my ($flag1,$flag2);

eval_fragment('$Devel::EvalFragment::Testing::flag1 = 42}');
is $Devel::EvalFragment::Testing::flag1,42,'evaling code works';
eval_fragment(q[$Devel::EvalFragment::Testing::flag2 = 66};fail("the parse isn't stopped")]);
is $Devel::EvalFragment::Testing::flag2,66,"the code after the } brace doesn't get run";
sub check {
    my ($code,$trash) = @_;
    is(eval_fragment($code.'}'.$trash),length($code)+1,$code.'}'.$trash);
}
check '','';
check '{123}',' dsafdsfdf #$@ dfdf';
check " #1\n#2\n#3\n","#1\n#2\n#3";
done_testing;
