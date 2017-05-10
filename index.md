# SDIF

### is Side-by-side diff viewer

### for ANSI color terminal

### capable of word context display powerd by CDIF

[![default](http://kaz-utashiro.github.io/sdif/images/screen-shot-default.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-default.jpg)


# Flexible color

### ANSI 256 colors

[![green](http://kaz-utashiro.github.io/sdif/images/screen-shot-green.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-green.jpg)


# International

### Unicode

### East Asian wide width character

### Japanese Kanji/Hiragana/Katakana separation

[![japanese](http://kaz-utashiro.github.io/sdif/images/screen-shot-japanese.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-japanese.jpg)

### Korean

[![korean](http://kaz-utashiro.github.io/sdif/images/screen-shot-korean.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-korean.jpg)

### Chinese

[![chinese](http://kaz-utashiro.github.io/sdif/images/screen-shot-chinese.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-chinese.jpg)


# Japanese syllable tokenizer

### --mecab morphology

[![mecab](http://kaz-utashiro.github.io/sdif/images/screen-shot-mecab.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-mecab.jpg)

[![mecab](http://kaz-utashiro.github.io/sdif/images/screen-shot-mecab-comp.jpg)](http://kaz-utashiro.github.io/sdif/images/screen-shot-mecab-comp.jpg)

# NAME

sdif - side-by-side diff viewer for ANSI terminal

# SYNOPSIS

sdif file\_1 file\_2

diff ... | sdif

    --number, -n        print line number
    --digit=#           set the line number digits (default 4)
    --truncate, -t      truncate long line
    --onword            fold line on word boundaries
    --context, -c, -C#  context diff
    --unified, -u, -U#  unified diff

    --width=#, -W#      specify width of output (default 80)
    --[no]color         use color or not (default on)
    --colormap, --cm    specify color map
    --colortable        show color table
    --[no]256           on/off ANSI 256 color mode (default on)
    --mark=position     mark position (right, left, center, side) or no
    --view, -v          viewer mode

    --man               display manual page
    --diff=s            set diff command
    --diffopts=s        set diff command options

    --cdif              use ``cdif'' as word context diff backend
    --cdifopts=s        set cdif command options
    --mecab             pass --mecab option to cdif

# DESCRIPTION

__sdif__ is inspired by System V [sdiff(1)](http://man.he.net/man1/sdiff) command.  The basic
feature of sdif is making a side-by-side listing of two different
files.  All contents of two files are listed on left and right sides.
Center column is used to indicate how different those lines.  No mark
means no difference.  Added, deleted and modified lines are marked
with \`<' and \`>' character.

    1 deleted  <
    2 same          1 same
    3 changed  <>   2 modified
    4 same          3 same
                >   4 added

It also reads and formats the output from __diff__ command from
standard input.  Besides normal diff output, context diff _-c_ and
unified diff _-u_ output will be handled properly.

Each lines can be displayed in different colors.  Read __--colormap__
section in ths manual for detail.

While __sdif__ doesn't care about the contents of each modified lines,
it can read the output from __cdif__ command which show the word
context differences of each lines.  Option __--cdif__ set the
appropriate options for __cdif__.  Set _--nocc_, _--nomc_ options at
least when invoking __cdif__ manually.  Option _--notc_ is pereferable
because text color can be handled by __sdif__.

Environment valuable __SDIFOPTS__ is used to set default options.

# OPTIONS

- __--width__=_width_, __-W__ _width_

    Use width as a width of output listing.  Default width is 80.  If the
    standard error is assinged to a terminal, the width is taken from it
    if possible.

- __--number__, __-n__

    Print line number on each lines.

- __--digit__=_n_

    Line number is diplayed in 4 digits by dafult.  Use this option to
    change it.

- __-c__, __-C___n_, __-u__, __-U___n_

    Passed through to the back-end diff command.  Sdif can interpret the
    output from normal, context (_diff -c_) and unified diff (_diff
    \-u_).

- __--truncate__, __-t__

    Truncate lines if they are longer than printing width.

- __--onword__

    Fold longs line at word boundaries.

- __--cdif__

    Use __cdif__ command instead of normal diff command.

- __--cdifopts__=_option_

    Specify options for backend __cdif__ command.

- __--mecab__

    Pass __--mecab__ option to backend __cdif__ command.  Use __--cdifopts__
    to set other options.

- __--diff__=_command_

    Any command can be specified as a diff command to be used.  Piping
    output to __sdif__ is easier unless you want to get whole text.

- __--diffopts__=_option_

    Specify options for backend __diff__ command.

- __--mark__=_position_

    Specify the position for mark.  Choose from _left_, _right_,
    _center_, _side_ or _no_.  Default is _center_.

- __--__\[__no__\]__color__

    Use ANSI color escape sequence for output.  Default is true.

- __--__\[__no__\]__256__

    Use ANSI 256 color mode.  Default is true.

- __--colortable__

    Show table of ANSI 216 colors.

- __--view__, __-v__

    Viewer mode.  Display two files side-by-side in straightforward order.

- __--colormap__=_colormap_, __--cm__=_colormap_

    Basic _colormap_ format is :

        FIELD=COLOR

    where the FIELD is one from these :

        OLD       NEW       UNCHANGED
        --------- --------- ---------
        OCOMMAND  NCOMMAND           : Command line
        OFILE     NFILE              : File name
        OMARK     NMARK     UMARK    : Mark
        OLINE     NLINE     ULINE    : Line number
        OTEXT     NTEXT     UTEXT    : Text

    If ULINE is empty, OLINE and NLINE is used instead.

    You can make multiple filelds same color joining them by = :

        FIELD1=FIELD2=...=COLOR

    Also wildcard can be used for field name :

        *CHANGE=BDw

    Multiple fields can be specified by repeating options

        --cm FILED1=COLOR1 --cm FIELD2=COLOR2 ...

    or combined with comma (,) :

        --cm FILED1=COLOR1,FIELD2=COLOR2, ...

    COLOR is combination of single character representing uppercase
    foreground color :

        R  Red
        G  Green
        B  Blue
        C  Cyan
        M  Magenta
        Y  Yellow
        K  Black
        W  White

    and corresponding lowercase background color :

        r, g, b, c, m, y, k, w

    or RGB value if using ANSI 256 color terminal :

        FORMAT:
            foreground[/background]

        COLOR:
            000 .. 555       : 6 x 6 x 6 216 colors
            000000 .. FFFFFF : 24bit RGB mapped to 216 colors

        Sample:
            005     0000FF        : blue foreground
               /505       /FF00FF : magenta background
            000/555 000000/FFFFFF : black on white
            500/050 FF0000/00FF00 : red on green

    and other effects :

        S  Standout (reverse video)
        U  Underline
        D  Double-struck (boldface)
        F  Flash (blink)
        E  Expand

    __E__ is effective for command, file and text line.  That line will be
    expanded to window width filling up by space characters.  Left column
    is expanded always.  You may want to use this to set background color
    for right column.

    Defaults are :

        OCOMMAND => "CSE"
        NCOMMAND => "MSE"
        OFILE    => "CDSE"
        NFILE    => "MDSE"
        OMARK    => "Cw"
        NMARK    => "Mw"
        UMARK    => "w"
        OLINE    => "Y"
        NLINE    => "Y"
        ULINE    => "Y"
        OTEXT    => "E/554" or "C"
        NTEXT    => "E/554" or "M"
        UTEXT    => ""

    This is equivalent to :

        sdif --cm 'OCOMMAND=CSE,NCOMMAND=MSE,OFILE=CDE,NFILE=MDE' \
             --cm 'OMARK=Cw,NMARK=Mw,UMARK=w' \
             --cm '*LINE=Y,[ON]TEXT=E/554,UTEXT='

# AUTHOR

- Kazumasa Utashiro
- [https://github.com/kaz-utashiro/](https://github.com/kaz-utashiro/)

# SEE ALSO

- sdif
    - [https://github.com/kaz-utashiro/sdif](https://github.com/kaz-utashiro/sdif)
    - [http://kaz-utashiro.github.io/sdif/](http://kaz-utashiro.github.io/sdif/)
- cdif
    - [https://github.com/kaz-utashiro/cdif](https://github.com/kaz-utashiro/cdif)
    - [http://kaz-utashiro.github.io/cdif/](http://kaz-utashiro.github.io/cdif/)
