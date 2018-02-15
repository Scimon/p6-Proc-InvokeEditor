use v6.c;
unit class Proc::InvokeEditor:ver<0.0.1>:auth<Simon Proctor "simon.proctor@gmail.com", Matthew Chubb, Edward Francis, Kenric Leung>;

has Str @!editors;

multi method edit( Str $text --> Str ) {...}
multi method edit( Str @lines --> Str ) {...}

multi method edit-to-str( Str $text --> Str ) {...}
multi method edit-to-str( Str @lines --> Str ) {...}

multi method edit-to-array( Str $text --> Array ) {...}
multi method edit-to-array( Str @lines --> Array ) {...}

=begin pod

=head1 NAME

Proc::InvokeEditor - Edit strings in an external editor. 

=head1 SYNOPSIS

  use Proc::InvokeEditor;

=head1 DESCRIPTION

Proc::InvokeEditor is ...

=head1 AUTHORS

Simon Proctor <simon.proctor@gmail.com>, Matthew Chubb, Edward Francis, Kenric Leung

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
