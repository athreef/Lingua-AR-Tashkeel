use strict;
use warnings;
package Lingua::AR::Vowels;

# ABSTRACT: 
# VERSION

use Carp;
use charnames ':full';
use Unicode::Normalize;

=pod

=encoding utf8

=head1 NAME

Lingua::AR::Vowels - Subroutines for handling Arabic Vowels and Vowel marks


=head1 SYNOPSIS

    use Lingua::AR::Vowels;

    # Strip all short vowels
    Lingua::AR::Vowels->strip('مَكَرُونَة'); # => مكرونة
    # Heuristic for removing short vowels without causing ambiguity
    Lingua::AR::Vowels->prune('فَتَّة');    # => فتة
    # Heuristic for fixing mixed up short and long vowels
    Lingua::AR::Vowels->fix('ماحشي');    # => مَحشي 


=head1 DESCRIPTION

=head1 IMPLEMENTATION

=head1 METHODS AND ARGUMENTS

=over 4

=item new()

Constructs a new Lingua::AR::Vowels instance.

=cut

sub new {
	my $class = shift;
    
    my $self = {};

	bless $self, $class;
	return $self;
}

=item strip($string)

Strips away all Arabic short vowels (Tashkeel).

=cut

sub strip {
    my $self = shift;
    my ($string) = NFD @_; 
    
    $string =~ s/(?=\p{InArabic})\p{Mn}//g;

	return $string;
}

=item prune($string)

Heuristic for pruning the short vowels that a native speaker wouldn't write,r
as leaving them out wouldn't introduce ambiguity.

This is often preferable to strip, as Shadda's and Dammas that indicate a passive verb are useful clues that one might want to keep.

=cut

sub prune {
    my $self = shift;
    my ($string) = NFD @_; 
    
    $string =~ s/(?=\p{InArabic})(?!\N{ARABIC SHADDA})\p{Mn}//g;

	return $string;
}

=item fix($string)

Transliterating from a romanized representation of Arabic to actual Arabic script often gives incorrect results regarding short/long vowels.

This subroutine implements a heuristic for fixing such mix ups.

=cut

sub fix {
    my $self = shift;
    my ($string) = NFD @_; 
    
	return $string;
}

1;
__END__

=back

=head1 GIT REPOSITORY

L<http://github.com/a3f/Lingua-AR-Vowels>

=head1 SEE ALSO

L<Perl|Perl>

=head1 AUTHOR

Ahmad Fatoum C<< <athreef@cpan.org> >>, L<http://a3f.at>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 Ahmad Fatoum

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
