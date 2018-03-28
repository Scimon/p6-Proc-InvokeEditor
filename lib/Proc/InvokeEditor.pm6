use v6.c;
unit class Proc::InvokeEditor:ver<0.0.1>:auth<Simon Proctor "simon.proctor@gmail.com">;

constant DEFAULT_EDITORS = Array[Str].new( |( <<VISUAL EDITOR>>.grep( { defined %*ENV{$_} } ).map( { %*ENV{$_} } ) ),
                                          '/usr/bin/vi', '/bin/vi',
                                          '/usr/bin/emacs', '/bin/emacs',
                                          '/bin/ed', );

has Str @!editors;

submethod BUILD( :@editors = DEFAULT_EDITORS ) {
    @!editors = @editors;
}

multi method editors(Proc::InvokeEditor:U: --> Array[Str]) {
    DEFAULT_EDITORS;
}

multi method editors(Proc::InvokeEditor:U: *@ --> Array[Str]) {
    fail("Can't edit editor list in class, perhaps you'd like to create an object?");
}

multi method editors(Proc::InvokeEditor:D: --> Array[Str]) {
    @!editors;
}

multi method editors(Proc::InvokeEditor:D: +@new-editors where { $_.all ~~ Str } --> Array[Str]) {
    @!editors = @new-editors;
}

multi method first_usable(Proc::InvokeEditor:D: --> Array[Str]) {
    find-usable( @!editors );
}

multi method first_usable(Proc::InvokeEditor:U: --> Array[Str]) {
    find-usable( DEFAULT_EDITORS );
}


sub find-usable( Str @possible --> Array[Str] ) {
    my Str @out;
    for @possible -> Str $test {
        my ( $test-file, @args ) = $test.split( / \s / );

        if $test-file.IO ~~ :e & :x {
            @out.push($test-file, |@args);
            return @out;
        }
    }
    fail("Unable to find a useable editor in : {@possible.gist}");
}


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

=head1 AUTHOR

Simon Proctor <simon.proctor@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
