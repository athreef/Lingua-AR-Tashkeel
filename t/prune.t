use Test::More;
use utf8;

BEGIN {
    use_ok 'Lingua::AR::Tashkeel';
}

my %samples = (
    #"مَكَرُونَة" => 'مكرونة',
    #"فَتَّة"    => 'فتّة',
    "ماحشي"  => 'ماحشي',
);

while (my ($in, $expected) = each %samples) {
    my $transformed = Lingua::AR::Tashkeel->prune($in);
    is $transformed, $expected, "pruning $in";
}
done_testing;
