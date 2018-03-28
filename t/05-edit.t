use v6.c;
use Test;
use Proc::InvokeEditor;

my $path = $*PROGRAM.dirname;

ok my $invoker = Proc::InvokeEditor.new( :editors( [ $path ~ "/t05bin/doubler.pl6" ] ) ), "Can create an invoker object"; 

is $invoker.edit("This is one line"), "This is one lineThis is one line", "Doubler does it's thing";

done-testing
