\LoadClass[12pt, a4paper]{article}

%%%%% CARREGANDO PACOTES
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}	% Hifenização em Português Brasil
\RequirePackage[brazilian]{babel}
\RequirePackage[left=3cm, top=2.5cm, right=2.5cm, bottom=2.5cm]{geometry}
\RequirePackage{times}	% Fonte Times New Roman
\RequirePackage{amsmath, amssymb, amsfonts, amsthm, exscale}	% Pacotes Matemáticos

\RequirePackage[pdftex,colorlinks=true,linkcolor=black,urlcolor=black,anchorcolor=black,citecolor=black,filecolor=black,menucolor=black]{hyperref}

\RequirePackage{url}\urlstyle{same}				% Os link ficam com a mesma fonte do texto
\RequirePackage{setspace}						% Configurações do Texto
\RequirePackage{indentfirst}					% Primeiro parágrfo identado
\RequirePackage{titletoc, titlesec, tocloft}	% Configurar seção/subseção
\RequirePackage{fancyhdr}						% Configurar o estilo da página. Cabeçalho/Rodapé/Número de página
\RequirePackage{graphicx} 						% Inserir imagens/figuras
\RequirePackage{subcaption}						% Configurar legendas das figuras/tabelas
\RequirePackage{footmisc}						% Config. citação de nota de rodapé
\RequirePackage{adjustbox, array}				% Rotacionar a tabela e aumentar a largura da coluna
\RequirePackage{xifthen}
\RequirePackage{etoolbox}


%%%%% PACOTES TEMPORÁRIOS
\RequirePackage{lipsum}


%%%%% CONFIGURANDO TEXTO
\setlength{\parindent}{1.5cm}	% Identação dos parágrafos
\onehalfspacing                 % Espaçamento entre linhas 1,5cm como padrão. Para duplo: \doublespacing; simples: \singlespacing
\setlength{\parskip}{12pt}		% Espaçamento entre os parágrafos


%%%%% CONFIG. ESTILO DE PÁGINA
\pagestyle{fancy}\fancyhf{}	
%% Cabeçalho
%\fancyhead[RO]{\vspace*{1\baselineskip}\thepage}
%\fancyhead[RE,LO]{TCC}
\renewcommand{\headrulewidth}{0pt}	% Espessura da linha de base
%% Rodapé
%\fancyfoot[CE,CO]{\leftmark}
\fancyfoot[RO]{\vspace*{-1\baselineskip}\thepage}
%\renewcommand{\footrulewidth}{0pt}


%%% CONFIG. CITAÇÃO DE NOTA DE RODAPÉ
\setlength{\footnotemargin}{0cm}
\renewcommand{\hangfootparindent}{0cm}
\newcommand\snfootnote[1]{%
	\begingroup%
		\renewcommand\thefootnote{}\footnote{#1}%
		\addtocounter{footnote}{-1}%
	\endgroup%
}


%%%%% CONFIG. ESTILO DA SECÇÃO/SUBSECÇÃO/PARÁGRAFOS
% Diminuir tamanho da fonte e espaçamentos. \normalsize equivale à 12pt
\titleformat{\section}{\normalsize\bfseries}{\thesection}{12pt}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{12pt}{}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{12pt}{}
%\titleformat*{\paragraph}{\large\bfseries}
%\titleformat*{\subparagraph}{\large\bfseries}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}


%%%%% CONFIG. LEGENDAS DAS FIGURAS/TABELAS
\captionsetup[figure]{labelfont={bf}, labelsep=endash}
\captionsetup[subfigure]{labelfont={normal}}
\captionsetup[table]{labelfont={bf}, labelsep=endash}


%%%%% CONFIG. SUMÁRIO
\newcommand{\sumario}{%
	\clearpage\tocloftpagestyle{empty}%
	\renewcommand{\cfttoctitlefont}{\bf\hfill\normalsize\MakeUppercase}%
	\renewcommand{\cftaftertoctitle}{\hfill}%
	\renewcommand{\cftsecfont}{\normalfont\bfseries}%
	\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}%
	\renewcommand{\cftsecpagefont}{\normalfont}%
	\setlength{\cftsubsecindent}{0em}%
	\setlength{\cftsubsubsecindent}{0em}%
%	\renewcommand{\contentsname}{SUMÁRIO}
	\tableofcontents\newpage%
}


%%%%% CONFIG. LISTA DE FIGURAS
\newcommand{\listaDeFiguras}{%
	\clearpage\tocloftpagestyle{empty}%
	\renewcommand{\cftloftitlefont}{\hfill\bf\normalsize\MakeUppercase}%
	\renewcommand{\cftafterloftitle}{\hfill}%
	\renewcommand{\cftfigfont}{Figura~~}%
	\renewcommand{\cftfigaftersnum}{~~--~~}%
	%\renewcommand{\listfigurename}{LISTA DE FIGURAS}
	\listoffigures\newpage%
}


%%%%% CONFIG. LISTA DE TABELAS
\newcommand{\listaDeTabelas}{%
	\clearpage\tocloftpagestyle{empty}%
	\renewcommand{\cftlottitlefont}{\hfill\bf\normalsize\MakeUppercase}%
	\renewcommand{\cftafterlottitle}{\hfill}%
	\renewcommand{\cfttabfont}{Tabela~~}%
	\renewcommand{\cfttabaftersnum}{~~--~~}%
	%\renewcommand{\listtablename}{LISTA DE TABELAS}
	\listoftables\newpage%
}


%%%%% CONFIG. CAPA E FOLHA DE ROSTO
\newcommand{\campus}[2]{\gdef\cidade{#1}\gdef\estado{#2}}
\newcommand{\graduacao}[2]{\gdef\tipo{#1} \gdef\curso{#2}}
\renewcommand{\author}[2]{\gdef\@autorprimeiro{#1} \gdef\@autorsegundo{#2}}
\renewcommand{\title}[2]{\gdef\titulo{#1} \gdef\subtitulo{#2}}
\newcommand{\orientador}[1]{\gdef\@orientador{#1}}
\newcommand{\coOrientador}[1]{\gdef\@coOrientador{#1}}
\newcommand{\avaliadorUm}[1]{\gdef\@avaliadorUm{#1}}
\newcommand{\avaliadorDois}[1]{\gdef\@avaliadorDois{#1}}
\renewcommand{\date}[2]{\gdef\@mes{#1} \gdef\@ano{#2}}


\renewcommand{\maketitle}{%
	\pagenumbering{arabic}
	\clearpage\thispagestyle{empty}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\textbf{\Large Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais}}
			
			\vspace*{0.4cm}\MakeUppercase{\textbf{\Large Campus~\cidade}}
			
			\vspace*{1cm}\MakeUppercase{\textbf{\Large Curso Superior de~\tipo~em~\curso}}
			
			\vspace*{\stretch{0.7}}\MakeUppercase{\textbf{\Large Trabalho de Conclusão de Curso}}
			
			\vspace*{\stretch{0.5}}\MakeUppercase{\textbf{\large\titulo\ifdefempty{\subtitulo}{}{: \subtitulo}}}
			
			\vspace*{\stretch{0.5}}\MakeUppercase{\textbf{\large\@autorprimeiro~\@autorsegundo}}
			
			\vspace*{\stretch{1}}\MakeUppercase{\textbf{\large\cidade~(\estado)}}\\
			\textbf{\large\@ano}
		\end{singlespace}
	\end{center}
%
	\newpage\clearpage\thispagestyle{empty}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\textbf{\large Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais}}
	
			\vspace*{0.4cm}\MakeUppercase{\textbf{\large Campus~~\cidade}}
	
			\vspace*{1cm}\MakeUppercase{\textbf{\large Curso Superior de~\tipo~em~\curso}}
	
			\vspace*{\stretch{1.3}}\MakeUppercase{\textbf{\large\titulo\ifdefempty{\subtitulo}{}{: \subtitulo}}}
	
			\vspace*{\stretch{0.7}}\textbf{\MakeUppercase{\@autorprimeiro~\@autorsegundo}}
			
			\vspace*{0.7cm}\textit{Sob a orientação do Professor}\\
			\textbf{\@orientador}
		\end{singlespace}
	\end{center}

	\begin{singlespace}\vspace*{0.4cm}\leftskip=5cm\noindent
		Trabalho de Conclusão de Curso apresentado ao Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais -- Campus \cidade~ como parte das exigências do Programa de Graduação em \curso, para obtenção do título de \ifthenelse{\equal{\tipo}{Licenciatura}}{Licenciado}{Bacharel} em \curso.
	\end{singlespace}

	\vspace*{\stretch{2}}
	\begin{center}
		\MakeUppercase{\textbf{\cidade, \estado}}\\
		\@mes~de~\@ano
	\end{center}
}{}


%%%%% NOVOS AMBIENTES E NOVOS COMANDOS
\newenvironment{CitacaoLonga}{%
	\begin{singlespace}%
		\footnotesize%
		\parindent=0mm		% indentação nos parágrafos
		\noindent%
		\ignorespaces%
		\leftskip=4cm%
}{%
		\ignorespacesafterend%
	\end{singlespace}%
}

\newcommand{\referencias}{%
    \newpage%
    \phantomsection\addcontentsline{toc}{section}{REFERÊNCIAS}
    \section*{REFERÊNCIAS}
	\begin{singlespace}%
            \vspace*{-0.35cm}%
            \parindent=0mm%
            \parskip=16pt%
            \noindent%
            \ignorespaces%
            \flushleft%
            \input{Referencias/referencias}
            \ignorespacesafterend%
	\end{singlespace}%
}


\newcommand{\apendices}{ \ignorespacesafterend \input{Apendices/apendices}}
\newcounter{apendicecount}
\newcommand{\apendice}[1]{%
    \newpage%
    \refstepcounter{apendicecount}%
    \phantomsection\addcontentsline{toc}{section}{APÊNDICE \Alph{apendicecount} -- #1}%
    \begin{center}\bfseries APÊNDICE \Alph{apendicecount} -- #1\end{center}%
    
    \vspace*{-12pt}%
    \ignorespacesafterend%
}

\newcommand{\anexos}{\ignorespacesafterend \input{Anexos/anexos}}
\newcounter{anexocount}
\newcommand{\anexo}[1]{%
	\newpage%
	\refstepcounter{anexocount}%
	\phantomsection\addcontentsline{toc}{section}{ANEXO \Alph{anexocount} -- #1}%
	\begin{center}\bfseries ANEXO \Alph{anexocount} -- #1\end{center}%

	\vspace*{-12pt}
	\ignorespacesafterend%
}

\newcommand{\resumo}{%
	\clearpage\thispagestyle{empty}%
	\begin{center} \textbf{RESUMO} \end{center}%
	\vspace*{-0.8cm}%
	\begin{singlespace}%
		\parindent=0cm%
		\noindent%
		
		\MakeUppercase{\@autorsegundo}, \@autorprimeiro. \textbf{\titulo\ifdefempty{\subtitulo}{}{: }}\ifdefempty{\subtitulo}{}{\subtitulo}. \@ano. Monografia (Graduação em \tipo~em~\curso) Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais -- Campus \cidade, \cidade, \@ano.%
		
		\input{Resumo/resumo}
	
		\vspace*{1cm}%
		
		\snfootnote{\textbf{Orientador:} \@orientador}%
		\@ifundefined{@coOrientador}{}{%
			\snfootnote{\textbf{Co-Orientador:} \@coOrientador}%
		}%
		\ignorespaces%
	\end{singlespace}%
	\newpage%
}

\newcommand*{\dedicatoria}{%
	\clearpage\thispagestyle{empty}%
	\vspace*{\stretch{6}}%
	\begin{singlespace}%
		\normalsize%
		\parindent=0mm%
		\noindent%
		\ignorespaces%
		\leftskip=7cm%
		\input{Pre-texto/dedicatoria}%
		\ignorespacesafterend%
	\end{singlespace}%
	\newpage%
}

\newcommand*{\agradecimentos}{%
	\clearpage\thispagestyle{empty}%
	\begin{center} \textbf{AGRADECIMENTOS} \end{center}%
	\begin{onehalfspace}%
		\parindent=0cm%
		\parskip=6pt%
		\input{Pre-texto/agradecimentos}
    	\end{onehalfspace}%
	\newpage%
}

\newcommand{\autorEpigrafe}[1]{\gdef\autorEpigrafe{#1}}
\newcommand{\epigrafe}{%
	\clearpage\thispagestyle{empty}%
	\vspace*{\stretch{5}}
	\begin{singlespace}%
	        \flushright%
		\normalsize%
		\parindent=0mm%
		\noindent%
		\ignorespaces%
		\it%
		\input{Pre-texto/epigrafe}
		\ignorespacesafterend%
		\normalfont{\autorEpigrafe}
	\end{singlespace}%
	%\vspace*{\stretch{1}}%
}

\newcommand{\folhaDeAprovacao}{%
	\newpage\clearpage\thispagestyle{empty}
	\begin{center}
		\begin{singlespace}
			\MakeUppercase{\textbf{\large Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais}}
			
			\vspace*{0.4cm}\MakeUppercase{\textbf{\large Campus~~\cidade}}
			
			\vspace*{\stretch{1.3}}\MakeUppercase{\textbf{\large\titulo~\subtitulo}}

		\end{singlespace}
	\end{center}
	\vspace*{\stretch{1}}

	\begin{singlespace}\leftskip=5cm\noindent
		Trabalho de Conclusão de Curso apresentado ao Instituto Federal de Educação, Ciência e Tecnologia do Norte de Minas Gerais -- Campus \cidade~ como parte das exigências do Programa de Graduação em \curso, para obtenção do título de \ifthenelse{\equal{\tipo}{Licenciatura}}{Licenciado}{Bacharel} em \curso.
	\end{singlespace}

	\vspace*{\stretch{1}}
	\noindent APROVADO: \_\_\_\_/\_\_\_\_/\_\_\_\_\_\_
	\vspace*{2cm}
	
	\begin{minipage}[c]{\linewidth}\hspace*{-2cm}
		\begin{minipage}[l][2cm][l]{8cm}\centering
			\rule{7cm}{1pt}\\
			\vspace*{-0.2cm}\@avaliadorUm
			%\vspace*{-0.2cm}(Co-Orientador)
		\end{minipage}
		\begin{minipage}[r][2cm][l]{8cm}\centering
			\rule{7cm}{1pt}\\
			\vspace*{-0.2cm}\@avaliadorDois
		\end{minipage}
	\end{minipage}
	
	\vspace*{1.cm}
	\begin{center}
		\rule{7cm}{1pt}\\
		\vspace*{-0.2cm}\@orientador \\
		\vspace*{-0.2cm}(Orientador)
	\end{center}
}
