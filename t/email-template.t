use strict;
use warnings;
use Cwd 'abs_path';
my $tt2 = abs_path($0) .'t2';

use Test::More tests => 3;

use_ok 'Email::Template';

ok Email::Template->send( $tt2,
        {
            From    => 'sender@domain.tld',
            To      => 'recipient@domain.tld',
            Subject => 'Email::Template is easy to use',
            tt_vars => { key0 => 'value0', key1 => 'value1', },
            convert => { no_rowspacing => 1, rm => 80, },
        }
    ),
    'Email::Template->send()';

isa_ok Email::Template->send( $tt2,
        {
            From    => 'sender@domain.tld',
            To      => 'recipient@domain.tld',
            Subject => 'Email::Template is easy to use',
            tt_vars => { key0 => 'value0', key1 => 'value1', },
            return_mime_lite => 1,
        }
    ),
    'MIME::Lite';
