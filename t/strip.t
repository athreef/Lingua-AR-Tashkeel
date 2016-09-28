use Test::More;
use utf8;

BEGIN {
    use_ok 'Lingua::AR::Tashkeel';
}

my %samples = (
    "مَكَرُونَة" => 'مكرونة',
    "فَتَّة"    => 'فتة',
    "ماحشي"  => 'ماحشي',
    "ألف"    => 'ألف',

);

while (my ($in, $expected) = each %samples) {
    my $transformed = Lingua::AR::Tashkeel->strip($in);
    is $transformed, $expected, "stripping $in";
}
done_testing;
