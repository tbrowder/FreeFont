[![Actions Status](https://github.com/tbrowder/FreeFont/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/FreeFont/actions) [![Actions Status](https://github.com/tbrowder/FreeFont/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/FreeFont/actions) [![Actions Status](https://github.com/tbrowder/FreeFont/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/FreeFont/actions)

NAME
====

**FreeFont** - Provides convenience classes to ease GNU FreeFont font handling in different faces and sizes

SYNOPSIS
========

```raku
use FreeFont;
my $ff = FreeFont.new;
# get a font object for use with PDF documents
my $f1 = $ff.get-font: t12d5;
say $f1.name:  # OUTPUT: «Free Serif␤»
say $f1.size;  # OUTPUT: «12.5␤»
say $f1.file;  # OUTPUT: «/usr/share/fonts/opentype/freefont/FreeSerif.otf␤»
say $f1.alias; # OUTPUT: «Times␤»
```

Installation requirements
=========================

The following system packages need to be installed to use this module:

  * The FontConfig library

    On Debian:

        $ sudo aptitude install fontconfig

  * The FreeFont font files

    On Debian:

        $ sudo aptitude install fonts-freefont-otf

On other systems the files may be downloaded from [https://ftp.gnu.org/gnu/freefont](https://ftp.gnu.org/gnu/freefont) and installed in any desired place. The paths to the installed files should then be entered manually in the `$HOME/.FreeFont/config.yml` file which is created upon installation. That file should look like this (replace the '?' with the full path to the '.otf' file):

    # Font face name    : /path/to/file.otf
    FreeSerif           : ?
    FreeSerifBold       : ?
    FreeSerifItalic     : ?
    FreeSerifBoldItalic : ?
    FreeSans            : ?
    FreeSansBold        : ?
    FreeSansOblique     : ?
    FreeSansBoldOblique : ?
    FreeMono            : ?
    FreeMonoBold        : ?
    FreeMonoOblique     : ?
    FreeMonoBoldOblique : ?

DESCRIPTION
===========

**FreeFont** is a package that provides easy handling of the GNU FreeFont set of OpenType fonts which closely match the classic Adobe Type 1 free fonts shown in the following table. Unlike the original Adobe fonts, these fonts also include thousands of Unicode characters. The fonts are also among the few, freely-available fonts that have Type 1 kerning.

See [https://www.gnu.org/software/freefont/sources/](https://www.gnu.org/software/freefont/sources/) for much more information on the sources and Unicode coverage of the GNU FreeFont collection.

Note the *Code* and *Code2* columns. Each row contains equivalent code you may use to select the FreeFont face. You can also use the reference number or the complete name (with or without spaces) if desired.

Table 1
-------

<table class="pod-table">
<caption>The GNU FreeFont Collection</caption>
<thead><tr>
<th>FreeFont Name</th> <th>Code</th> <th>Code2</th> <th>Reference No.</th>
</tr></thead>
<tbody>
<tr> <td>Free Serif</td> <td>se</td> <td>t</td> <td>1</td> </tr> <tr> <td>Free Serif Bold</td> <td>seb</td> <td>tb</td> <td>2</td> </tr> <tr> <td>Free Serif Italic</td> <td>sei</td> <td>ti</td> <td>3</td> </tr> <tr> <td>Free Serif Bold Italic</td> <td>sebi</td> <td>tbi</td> <td>4</td> </tr> <tr> <td>Free Sans</td> <td>sa</td> <td>h</td> <td>5</td> </tr> <tr> <td>Free Sans Bold</td> <td>sab</td> <td>hb</td> <td>6</td> </tr> <tr> <td>Free Sans Oblique</td> <td>sao</td> <td>ho</td> <td>7</td> </tr> <tr> <td>Free Sans Bold Oblique</td> <td>sabo</td> <td>hbo</td> <td>8</td> </tr> <tr> <td>Free Mono</td> <td>m</td> <td>c</td> <td>9</td> </tr> <tr> <td>Free Mono Bold</td> <td>mb</td> <td>cb</td> <td>10</td> </tr> <tr> <td>Free Mono Oblique</td> <td>mo</td> <td>co</td> <td>11</td> </tr> <tr> <td>Free Mono Bold Oblique</td> <td>mbo</td> <td>cbo</td> <td>12</td> </tr> <tr> <td>MICRE</td> <td>mi</td> <td>mi</td> <td>13 (not a FreeFont)</td> </tr>
</tbody>
</table>

Table 2
-------

<table class="pod-table">
<caption>The Equivalent Adobe Type 1 Fonts</caption>
<thead><tr>
<th>Adobe Type 1 Name</th> <th>Code</th> <th>Code2</th> <th>Reference No.</th>
</tr></thead>
<tbody>
<tr> <td>Times</td> <td>se</td> <td>t</td> <td>1</td> </tr> <tr> <td>Times Bold</td> <td>seb</td> <td>tb</td> <td>2</td> </tr> <tr> <td>Times Italic</td> <td>sei</td> <td>ti</td> <td>3</td> </tr> <tr> <td>Times Bold Italic</td> <td>sebi</td> <td>tbi</td> <td>4</td> </tr> <tr> <td>Helvetica</td> <td>sa</td> <td>h</td> <td>5</td> </tr> <tr> <td>Helvetica Bold</td> <td>sab</td> <td>hb</td> <td>6</td> </tr> <tr> <td>Helvetica Oblique</td> <td>sao</td> <td>ho</td> <td>7</td> </tr> <tr> <td>Helvetica Bold Oblique</td> <td>sabo</td> <td>hbo</td> <td>8</td> </tr> <tr> <td>Courier</td> <td>m</td> <td>c</td> <td>9</td> </tr> <tr> <td>Courier Bold</td> <td>mb</td> <td>cb</td> <td>10</td> </tr> <tr> <td>Courier Oblique</td> <td>mo</td> <td>co</td> <td>11</td> </tr> <tr> <td>Courier Bold Oblique</td> <td>mbo</td> <td>cbo</td> <td>12</td> </tr> <tr> <td>MICRE</td> <td>mi</td> <td>mi</td> <td>13 (not an Adobe Type 1 font)</td> </tr>
</tbody>
</table>

Notes on the MICR Encoding (MICRE) font
---------------------------------------

Each table above shows one more font that is included in the '/resources' directory, along with two more files, that will be installed into your '$HOME' directory. That is a MICRE font in TrueType format ('.ttf'). The MICR Encoding font, used for bank checks, was obtained from [1001fonts.com](https://www.1001fonts.com/micr-encoding-font.html).

The downloaded file was named `micr-encoding.zip` (which was deleted after unzipping it). When file `micr-encoding.zip` was unzipped into an `unzipped` directory, the following files were found:

      '!DigitalGraphicLabs.html'
      '!license.txt'
      micrenc.ttf

The two files in single quotes were renamed to:

    DigitalGraphicLabs.html
    license.txt

and all three files will be installed in your '$HOME' directory.

The license basically says the font is free to use for non-commercial purposes. Consult the license carefully if you do intend to so use it.

The Font class
==============

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2024 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

