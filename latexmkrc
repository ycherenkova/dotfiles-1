$latex = 'latex -src-specials -parse-first-line -c-style-errors';
$pdflatex = 'pdf' . $latex;
$dvi_previewer = 'exit'; # don't start a previewer for me
@default_files = ('main');
$clean_ext = # space separated string
join(' ', qw( fmt acn acr alg gls glo glg ist nls nlo nlg brf out pdfsync rel));
push @cus_dep_list, "nlo nls 0 nlo2nls"; # nomenclature
sub nlo2nls { system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg"); }
push @cus_dep_list, "acn acr 0 acn2acr"; # glossaries and acronym hack
sub acn2acr { system("makeindex $_[0].acn -s main.ist -o $_[0].acr -t $_[0].alg"); }
push @cus_dep_list, "glo gls 0 glo2gls"; #MiKTeX 2.6 has a broken makeglossaries.exe
sub glo2gls { system("makeindex $_[0].glo -s main.ist -o $_[0].gls -t $_[0].glg"); }
