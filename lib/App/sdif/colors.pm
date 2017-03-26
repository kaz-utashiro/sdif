=head1 NAME

App::sdif::colors

=head1 SYNOPSIS

  sdif -Mcolors --green
  sdif -Mcolors --dark_green
  sdif -Mcolors --cmy
  sdif -Mcolors --dark_cmy
  sdif -Mcolors --mono
  sdif -Mcolors --dark_mono

=head1 SEE ALSO

L<App::sdif::osx_autocolor>

=cut

package App::sdif::colors;

1;

__DATA__

define :CDIF      APPEND=DELETE=K/545,*CHANGE=K/455
define :DARK_CDIF APPEND=DELETE=555/311,*CHANGE=555/113

option	--green \
	--cm ?COMMAND=010/555;SE	\
	--cm    ?FILE=010/555;SED	\
	--cm    ?MARK=010/444		\
	--cm    UMARK=			\
	--cm    ?LINE=220		\
	--cm    ?TEXT=K/454;E		\
	--cm    UTEXT=			\
	--cdifopts '--cm :CDIF'

option	--dark_green \
	--cm ?COMMAND=444/010;E		\
	--cm    ?FILE=444/010;ED	\
	--cm    ?MARK=444/111		\
	--cm    UMARK=			\
	--cm    ?LINE=220		\
	--cm    ?TEXT=555/121		\
	--cm    UTEXT=444		\
	--cdifopts '--cm :DARK_CDIF'

option	--cmy \
	--cm OCOMMAND=C/555;SE		\
	--cm NCOMMAND=M/555;SE		\
	--cm MCOMMAND=Y/555;SE		\
	--cm    OFILE=C/555;SED		\
	--cm    NFILE=M/555;SED		\
	--cm    MFILE=Y/555;SED		\
	--cm    OMARK=C/444		\
	--cm    NMARK=M/444		\
	--cm    MMARK=Y/444		\
	--cm    UMARK=/444		\
	--cm    ?LINE=Y			\
	--cm    ?TEXT=KE/554		\
	--cm    UTEXT=			\
	--cdifopts '--cm :CDIF'

option	--dark_cmy \
	--cm OCOMMAND=555/011;E		\
	--cm NCOMMAND=555/202;E		\
	--cm MCOMMAND=555/110;E		\
	--cm    OFILE=555/011;ED	\
	--cm    NFILE=555/202;ED	\
	--cm    MFILE=555/K;ED	\
	--cm    ?MARK=555/110		\
	--cm    ?MARK=000/333		\
	--cm    UMARK=			\
	--cm    ?LINE=110		\
	--cm    ?TEXT=555/111;E		\
	--cm    UTEXT=			\
	--cdifopts '--cm :DARK_CDIF'

option	--mono \
	--cm ?COMMAND=111;SE	\
	--cm    ?FILE=111;DSE	\
	--cm    ?MARK=000/333	\
	--cm    UMARK=		\
	--cm    ?LINE=222	\
	--cm    ?TEXT=000/444	\
	--cm    UTEXT=111	\
	--cdifopts '--cm APPEND=DELETE=555/222,*CHANGE=000/333'

option	--dark_mono \
	--cm ?COMMAND=333;SE	\
	--cm    ?FILE=333;DSE	\
	--cm    ?MARK=000/333	\
	--cm    UMARK=		\
	--cm    ?LINE=333	\
	--cm    ?TEXT=555/111	\
	--cm    UTEXT=444	\
	--cdifopts '--cm APPEND=DELETE=555/222,*CHANGE=000/333'
