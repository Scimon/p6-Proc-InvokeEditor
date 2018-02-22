use v6.c;
unit class Proc::InvokeEditor:ver<0.0.1>:auth<Simon Proctor "simon.proctor@gmail.com", Matthew Chubb, Edward Francis, Kenric Leung>;

has Str @!editors;

method editors() { ("emacs") }

multi method edit( *@lines --> Str ) {
    self.edit( @lines.join("\n") );
}

multi method edit( Str() $text --> Str ) {...}

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
