# NAME

sdif - side-by-side diff viewer for ANSI terminal

# SYNOPSIS

sdif file\_1 file\_2

diff ... | sdif

    --number, -n        print line number
    --digit=n           set the line number digits (default 4)
    --truncate, -t      truncate long line
    --onword            fold line on word boundaries
    --width, -w #       specify width of output (default is 80)
    --diff=s            set diff command
    --diffopts=s        set diff command options
    --[no]color         use color or not
    --colormap, --cm    specify color map
    --mark=position     mark position (right, left, center, side) or no
    --man               display manual page
    -c, -C#             context diff
    -u, -U#             unified diff

    --cdif              use ``cdif'' as word context diff backend
    --cdifopts          set ``cdif'' command options

# DESCRIPTION

Sdif is inspired by System V sdiff(1) command.  The basic feature of
sdif and sdiff is making a side-by-side listing of two different
files.  All contents of two files are listed on left and right sides.
Center column is used to indicate how different the line.  No mark
means there is no difference.  Added, deleted and modified lines are
marked with \`<' and \`>' character.

    1 deleted  <
    2 same          1 same
    3 changed  <>   2 modified
    4 same          3 same
                >   4 added

# OPTIONS

- __--w__=_width_, -w

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

- __--colormap__=_colormap_, __--cm__=_colormap_

    Basic _colormap_ format is :

        FIELD=COLOR

    where the FIELD is one from these :

        OCOMMAND Old command line
        NCOMMAND Old command line
        OFILE    Old filename
        NFILE    New filename
        OMARK    Old mark
        NMARK    New mark
        UMARK    Unchanged mark
        OLINE    Old line
        NLINE    New line
        ULINE    Unchanged line
        OTEXT    Old text
        NTEXT    New text
        UTEXT    Unchanged text

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
        OFILE    => "CDE"
        NFILE    => "MDE"
        OMARK    => "Cw"
        NMARK    => "Mw"
        UMARK    => "w"
        OLINE    => "Y"
        NLINE    => "Y"
        ULINE    => "Y"
        OTEXT    => "C"
        NTEXT    => "M"
        UTEXT    => ""

    This is equivalent to :

        sdif --cm 'OCOMMAND=CSE,NCOMMAND=MSE,OFILE=CDE,NFILE=MDE' \
             --cm 'OMARK=Cw,NMARK=Mw,UMARK=w' \
             --cm '*LINE=Y,OTEXT=C,NTEXT=M,UTEXT='

    Try next setting if you want to make modified section more visible.

        sdif -n --cdif --cm '[ON]TEXT=wE,UMARK=,OMARK=C,NMARK=M'

# AUTHOR

Kazumasa Utashiro

https://github.com/kaz-utashiro/

# SEE ALSO

perl(1),
diff(1),
cdif(1)
