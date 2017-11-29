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

**sdif** is inspired by System V [sdiff(1)](http://man.he.net/man1/sdiff) command.  The basic
feature of sdif is making a side-by-side listing of two different
files.  All contents of two files are listed on left and right sides.
Center column is used to indicate how different those lines.  No mark
means no difference.  Added, deleted and modified lines are marked
with \`-' and \`+' character.

    1 deleted  -
    2 same          1 same
    3 changed  -+   2 modified
    4 same          3 same
                +   4 added

It also reads and formats the output from **diff** command from
standard input.  Besides normal diff output, context diff _-c_ and
unified diff _-u_ output will be handled properly.  Combined diff
format is also supported, but currently limited up to three files.

Each lines can be displayed in different colors.  Read **--colormap**
section in this manual for detail.

While **sdif** doesn't care about the contents of each modified lines,
it can read the output from **cdif** command which show the word
context differences of each lines.  Option **--cdif** set the
appropriate options for **cdif**.  Set _--nocc_, _--nomc_ options at
least when invoking **cdif** manually.  Option _--notc_ is preferable
because text color can be handled by **sdif**.

Environment valuable **SDIFOPTS** is used to set default options.

# OPTIONS

- **--width**=_width_, **-W** _width_

    Use width as a width of output listing.  Default width is 80.  If the
    standard error is assigned to a terminal, the width is taken from it
    if possible.

- **--number**, **-n**

    Print line number on each lines.

- **--digit**=_n_

    Line number is displayed in 4 digits by default.  Use this option to
    change it.

- **-c**, **-C**_n_, **-u**, **-U**_n_

    Passed through to the back-end diff command.  Sdif can interpret the
    output from normal, context (_diff -c_) and unified diff (_diff
    \-u_).

- **--truncate**, **-t**

    Truncate lines if they are longer than printing width.

- **--onword**

    Fold long line at word boundaries.

- **--cdif**

    Use **cdif** command instead of normal diff command.

- **--cdifopts**=_option_

    Specify options for back-end **cdif** command.

- **--mecab**

    Pass **--mecab** option to back-end **cdif** command.  Use **--cdifopts**
    to set other options.

- **--diff**=_command_

    Any command can be specified as a diff command to be used.  Piping
    output to **sdif** is easier unless you want to get whole text.

- **--diffopts**=_option_

    Specify options for back-end **diff** command.

- **--mark**=_position_

    Specify the position for a mark.  Choose from _left_, _right_,
    _center_, _side_ or _no_.  Default is _center_.

- **--**\[**no**\]**color**

    Use ANSI color escape sequence for output.  Default is true.

- **--**\[**no**\]**256**

    Use ANSI 256 color mode.  Default is true.

- **--colortable**

    Show table of ANSI 216 colors.

- **--view**, **-v**

    Viewer mode.  Display two files side-by-side in straightforward order.

- **--colormap**=_colormap_, **--cm**=_colormap_

    Basic _colormap_ format is :

        FIELD=COLOR

    where the FIELD is one from these :

        OLD       NEW       MERGED    UNCHANGED
        --------- --------- --------- ---------
        OCOMMAND  NCOMMAND  MCOMMAND           : Command line
        OFILE     NFILE     MFILE              : File name
        OMARK     NMARK     MMARK     UMARK    : Mark
        OLINE     NLINE     MLINE     ULINE    : Line number
        OTEXT     NTEXT     MTEXT     UTEXT    : Text

    If UMARK and/or ULINE is empty, OMARK/NMARK and/or OLINE/NLINE are
    used instead.

    You can make multiple fields same color joining them by = :

        FIELD1=FIELD2=...=COLOR

    Also wildcard can be used for field name :

        *CHANGE=BDw

    Multiple fields can be specified by repeating options

        --cm FILED1=COLOR1 --cm FIELD2=COLOR2 ...

    or combined with comma (,) :

        --cm FILED1=COLOR1,FIELD2=COLOR2, ...

    COLOR is a combination of single character representing uppercase
    foreground color :

        R  Red
        G  Green
        B  Blue
        C  Cyan
        M  Magenta
        Y  Yellow
        K  Black
        W  White

    and alternative (usually brighter) colors in lowercase :

        r, g, b, c, m, y, k, w

    or RGB values and 24 grey levels if using ANSI 256 or full color
    terminal :

        FORMAT:
            foreground[/background]

        COLOR:
            000 .. 555       : 6 x 6 x 6 216 colors
            000000 .. FFFFFF : 24bit RGB mapped to 216 colors
            L00 .. L23       : 24 grey levels

        Sample:
            005     0000FF        : blue foreground
               /505       /FF00FF : magenta background
            000/555 000000/FFFFFF : black on white
            500/050 FF0000/00FF00 : red on green

    and other effects :

        S  Stand-out (reverse video)
        U  Underline
        D  Double-struck (boldface)
        F  Flash (blink)
        E  Expand

    **E** is effective for command, file and text line.  That line will be
    expanded to window width filling up by space characters.  Left column
    is expanded always.  You may want to use this to set background color
    for right column.

    Defaults are :

        OCOMMAND => "555/010E"  or "GSE"
        NCOMMAND => "555/010E"  or "GSE"
        MCOMMAND => "555/010E"  or "GSE"
        OFILE    => "555/010DE" or "GSDE"
        NFILE    => "555/010DE" or "GSDE"
        MFILE    => "555/010DE" or "GSDE"
        OMARK    => "010/444"   or "G/W"
        NMARK    => "010/444"   or "G/W"
        MMARK    => "010/444"   or "G/W"
        UMARK    => ""
        OLINE    => "220"       or  "Y"
        NLINE    => "220"       or  "Y"
        MLINE    => "220"       or  "Y"
        ULINE    => ""
        OTEXT    => "KE/454"    or "G"
        NTEXT    => "KE/454"    or "G"
        MTEXT    => "KE/454"    or "G"
        UTEXT    => ""

    This is equivalent to :

        sdif --cm '?COMMAND=555/010E,?FILE=555/010DE' \
             --cm '?MARK=010/444,UMARK=' \
             --cm '?LINE=220,ULINE=' \
             --cm '?TEXT=KE/454,UTEXT='

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
