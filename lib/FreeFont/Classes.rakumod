unit module FreeFont::Classes;

use FreeFont::X::FontHashes;

%number = %FreeFont::X::FontHashes::number;

class DocFont is export {
    # these are provided by FreeFont's
    # sub 'get-font'
    has $.number is required;
    has $.size   is required;

    # remainder are generated in TWEAK
    #   without extension
    has $.fullname;  # full name with 
                     # spaces
    has $.name;      # full with no 
                     # spaces
    has $.shortname; # name.lc
    has $.basename;  # name.lc

    has $.alias; # full Type 1 name
    has $.code;
    has $.code2;
    #   with file extension
    has $.file;  # name.otf
    has $.path;  

    #   other attrs
    has $.weight; # Normal, Bold
    has $.slant;  # Italic, Oblique

    submethod TWEAK {
        my $n = $!number;

        # generated in TWEAK using %number
        #   without extension
        $!fullname  = %number{$n}<fullname>;  # full name with 
                                              # spaces
        $!name      = %number{$n}<name>;      # full with no 
                                              # spaces
        $!shortname = %number{$n}<shortname>; # name.lc

        $!alias     = %number{$n}<alias>;   # full Type 1 name
        $!code      = %number{$n}<code>;
        $!code2     = %number{$n}<code2>;
        #   with file extension
        $!file      = %number{$n}<file>;     # name.otf
        $!basename  = %number{$n}<basename>; # name.otf
        $!path      = %number{$n}<path>;     # provided by 
                                            # find-font
        #   other attrs
        $!weight    = %number{$n}<weight>;
        $!slant     = %number{$n}<slant>;
    }

    method license() {
        # DocFont attribute
        # based on number
        my $n = $.number;
        my $lic;
        if 0 < $n < 13 {
            # Gnu FreeFont fonts
            $lic = "GNU GPL V3";
        }
        elsif $n == 13 {
            $lic = "FREEWARE";
        }
        elsif $n == 14 {
            $lic = "GNU GPL V2";
        }
        elsif $n == 15 {
            $lic = "";
        }
        else {
            die "FATAL: Unexpected font number $n";
        }
   
        $lic
    } # end of method def

} # end of class DocFont definition
