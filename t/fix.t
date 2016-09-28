use Test::More;
use utf8;

BEGIN {
    use_ok 'Lingua::AR::Tashkeel';
}

my %samples = (
    "مَكَرُونَة" => 'مَكَرُونَة',
    #"فَتَّة"    => 'فَتَّة',
    #"ماحشي"  => 'مَحشي',
);

while (my ($in, $expected) = each %samples) {
    my $transformed = Lingua::AR::Tashkeel->fix($in);
    is $transformed, $expected, "fixing $in";
}
done_testing;
use Test::More

