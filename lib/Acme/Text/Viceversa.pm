package Acme::Text::Viceversa;

use 5.008001;
use strict;
use warnings;

use utf8;

our $VERSION = "0.05";

sub new {
    my $class = shift;
    return bless {}, $class;
}

my %ascii = (
    q' ' => ' ',    # same!
    q'!' => '¡',
    q'"' => '„',
    q'#' => '#',    # same!
    q'$' => '$',    # same!
    q'%' => '%',    # same!
    q'&' => '⅋',
    q|'| => '͵',
    q|(| => ')',
    q|)| => '(',
    q|*| => '*',    # same!
    q|+| => '+',    # same!
    q|,| => '‘',
    q|-| => '-',    # same!
    q|.| => '˙',
    q|/| => '/',    # same!

    q|0| => '0',    # same!
    q|1| => '⇂',
    q|2| => 'ᘔ',
    q|3| => 'ε',
    q|4| => '⇁⃓',
    q|5| => 'ᔕ',
    q|6| => '9',
    q|7| => 'L',
    q|8| => '8',    # same!
    q|9| => '6',
    q|:| => ':',    # same!
    q|;| => '⋅̕',
    q|<| => '>',
    q|=| => '=',    # same!
    q|>| => '<',
    q|?| => '¿',

    q|@| => '@',    # Can't be rotate
    q|A| => '∀',
    q|B| => 'ᗺ',
    q|C| => 'Ↄ',
    q|D| => 'p',
    q|E| => 'Ǝ',
    q|F| => 'Ⅎ',
    q|G| => '⅁',
    q|H| => 'H',    # same!
    q|I| => 'I',    # same!
    q|J| => 'ᒋ',
    q|K| => '丬',
    q|L| => 'ᒣ',
    q|M| => 'W',
    q|N| => 'N',    # same!
    q|O| => 'O',    # same!

    q|P| => 'Ԁ',
    q|Q| => 'Ό',
    q|R| => 'Ȣ',
    q|S| => 'S',    # same!
    q|T| => '⊥',
    q|U| => 'ᑎ',
    q|V| => 'Λ',
    q|W| => 'M',
    q|X| => 'X',    # same!
    q|Y| => '⅄',
    q|Z| => 'Z',    # same!
    q|]| => '[',
    q|\\| => '\\',    # same!
    q|[| => ']',
    q|^| => '‿',
    q|_| => '‾',

    q|`| => ' ̖',   #` # ɓuᴉʇɥɓᴉꞁɥɓᴉɥ xɐʇuʎs pᴉoʌɐ oʇ
    q|a| => 'ɐ',
    q|b| => 'q',
    q|c| => 'ɔ',
    q|d| => 'p',
    q|e| => 'ǝ',
    q|f| => 'ɟ',
    q|g| => 'ɓ',
    q|h| => 'ɥ',
    q|i| => 'ᴉ',
    q|j| => 'ſ̣',
    q|k| => 'ʞ',
    q|l| => 'ꞁ',
    q|m| => 'ɯ',
    q|n| => 'u',
    q|o| => 'o',    # same!

    q|p| => 'd',
    q|q| => 'b',
    q|r| => 'ɹ',
    q|s| => 's',    # same!
    q|t| => 'ʇ',
    q|u| => 'n',
    q|v| => 'ʌ',
    q|w| => 'ʍ',
    q|x| => 'x',    # same!
    q|y| => 'ʎ',
    q|z| => 'z',    # same!
    q|{| => '}',
    q{|} => '|',    # same!
    q|}| => '{',
    q|~| => '∼',    # same!
);

my %rot180 = %ascii;
while( my( $from, $to ) = each %ascii ){    # to make reversed list
    next if $to =~ /^[ -~]$/;               # skip if it was an ascii
    $rot180{$to} = $from;                   # add reversed key
}

sub ɐsɹǝʌǝɔᴉΛ {
    my $self = shift;
    my $str = shift;
    $str =~ s/\r\n/\n/g;
    my @results = ();
    foreach ( split "\n", $str ) {
        my @result = reverse map{ $self->ǝʇɐʇoɹ($_) } split /\s/, $_;
        unshift @results, join " ", @result;
    }
    return join "\n", @results;
}

sub ǝʇɐʇoɹ {
    my $self = shift;
    my $str = shift;
    my @results = ();
    my $string = '';
    my $buffer = '';
    while ( $string = substr( $str, 0, 1, '' ) or $string eq '0' ){
        if( exists $rot180{$string} ) {
            unshift @results, $rot180{$string};
            $buffer = '';
        }else{
            $buffer .= $string;     # some charactor has length 2
            next unless exists $rot180{$buffer};
            unshift @results, $rot180{$buffer};
            $buffer = '';
        }
    }
    return join "", @results;
}

1;
__END__

=encoding utf-8

=head1 AUTHOR
 
E<lt>ɯoɔ˙ꞁᴉɐɯɓ@ǝuᴉɯɥʇɹoʍE<gt> (ǝuᴉɯɥʇɹoʍ)ɐpᴉɥso⅄ ᴉʞn⅄

=head1 LICENSE

˙ɟꞁǝsʇᴉ ꞁɹǝԀ sɐ sɯɹǝʇ ǝɯɐs ǝɥʇ ɹǝpun ʇᴉ
ʎɟᴉpoɯ ɹo/puɐ ʇᴉ ǝʇnqᴉɹʇsᴉpǝɹ uɐɔ noʎ ⋅̕ǝɹɐʍʇɟos ǝǝɹɟ sᴉ ʎɹɐɹqᴉꞁ sᴉɥ⊥

˙ɐpᴉɥso⅄ ᴉʞn⅄ (Ↄ) ʇɥɓᴉɹʎdoↃ

=head1 DESCRIPTION
 
ǝɯɐu ǝꞁnpoɯ sɐ sɓuᴉɹʇs 8-ɟʇn ɓuᴉsn ɹoɟ ʇsǝʇ ǝɥʇ sᴉ ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀

=head1 SYNOPSIS
 
 text that you want to make upset #
 ⋅̕(͵ʇǝsdn ǝʞɐɯ oʇ ʇuɐʍ noʎ ʇɐɥʇ ʇxǝʇ͵)vicevarsa<-ʌ$ = ʇǝsdn$ ʎɯ
 ⋅̕()ʍǝu<-ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀ = ʌ$ ʎɯ
 
 ⋅̕ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀ ǝsn

=head1 NAME
 
ʇxǝʇ ǝɥʇ ʇǝsdn ʇsnᒋ - ɐsɹǝʌǝɔᴉΛ::ʇxǝ⊥::ǝɯɔ∀

=cut