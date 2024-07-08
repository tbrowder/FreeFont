use Test;

use QueryOS;
use File::Temp;

use FreeFont::BuildUtils;
use FreeFont::Resources;

my $debug = 0;

# access the /resources/* content
my %h = get-resources-hash;
#my @res = (get-resources-hash).values;
my @res = %h.values; #(get-resources-hash).values;

for @res -> $f {
    say "DEBUG: path '$f'" if $debug;
    next;

    my $b = $f.IO.basename;
    say "DEBUG: basename '$b'" if $debug;

    say "DEBUG: basename '$b'" if $debug;
    my $s;
    my $bin = False;
    if $b ~~ /:i otf|ttf $/ {
        $bin = True;
    }
    lives-ok {
        $s = get-resource-content $f, :$bin;
    }, "get content of '$b'";

    with $bin {
        when $_.so { is $f.^name, 'Buf[uint8]' }
        when not $_.so { is $f.^name, 'Str' }
    }
}

done-testing;

=finish


my $debug = 1;

my ($n, $s, $exit, $proc, @lines);
my ($n2, $s2, @lines2);

my $os = OS.new;


my $cmd;

if $os.is-linux {
    $cmd = "find /usr/share/fonts -type f -name ";
}
elsif $os.is-macos {
    # basename?
    $cmd = "find -L /opt -type f -name ";
}
elsif $os.is-windows {
    $cmd = "find";
}

my $f1;
if $os.is-windows {
    $f1 = "DejaVuSerif.ttf";
}
else {
    $f1 = "FreeSerif.otf";
}
my $f2 = "XbrzaChiuS";

# expect at least one find and no error
$proc  = run $cmd.words, $f1, :out;
@lines = $proc.out.slurp(:close).lines;
$exit  = $proc.exitcode;
is $exit, 0, "$cmd '$f1' works";
$n = @lines.elems;
$s = @lines.head // "";
cmp-ok $n, '>', 0, "1st found: '$s'";
say "DEBUG first found = '$s'" if $debug;

# expect zero finds but no error
$proc  = run $cmd.words, $f2, :out, :err;
@lines  = $proc.out.slurp(:close).lines;
@lines2 = $proc.err.slurp(:close).lines;
$exit   = $proc.exitcode;

if $os.is-linux {
    is $exit, 0,
        "file not found, exitcode $exit";
}
elsif $os.is-macos {
    is 1, 1, "mac exitcode for not found = '$exit'";
}

$n  = @lines.elems;
$n2 = @lines2.elems;
cmp-ok $n, '==', 0, "empty out as expected";
$s  = @lines.head // "";
$s2 = @lines2.head // "";
say "DEBUG s  = '$s'" if $debug;
say "DEBUG s2 = '$s2'" if $debug;

done-testing;
