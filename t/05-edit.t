use v6.c;
use Test;
use Proc::InvokeEditor;



my $path = $*PROGRAM.dirname;

my $exec = $*DISTRO.is-win ?? [ $path ~ "/t05bin/doubler.bat" ] !! [ $path ~ "/t05bin/doubler.pl6" ];
my $expected = $*DISTRO.is-win ?? "This is one line \nThis is one line \n" !! "This is one lineThis is one line";

ok my $invoker = Proc::InvokeEditor.new( :editors( $exec ) ), "Can create an invoker object";

is $invoker.edit("This is one line"), $expected, "Doubler does it's thing";

%*ENV<VISUAL> =  $*DISTRO.is-win ?? $path ~ "/t05bin/doubler.bat" !! $path ~ "/t05bin/doubler.pl6";

$expected = $*DISTRO.is-win ?? "This is also a line \nThis is also a line \n" !! "This is also a lineThis is also a line";

is Proc::InvokeEditor.edit("This is also a line"), $expected, "Class method works too";

done-testing
