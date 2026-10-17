% ----------------------------------------------------------------------------------------- %
%	Esta classe contém o modelo LaTeX de dissertação ou tese utilizado pela UNINOVE
%	nos programas de pós-graduação stricto sensu (PPGI e PPGP) e segue o
%	Manual de Orientação para Apresentação de Trabalhos Acadêmicos do Sistema de
%	Bibliotecas Prof. José Storópoli (atualizado em março de 2025), baseado em
%	ABNT NBR 14724:2024, NBR 10520:2023, NBR 6023:2018, NBR 6024:2012,
%	NBR 6027:2013 e NBR 6028:2021.
%
%	Alguns parâmetros foram baseados no modelo LaTeX do IME USP, desenvolvido
% 	pelo professor Jesús P. Mena-Chalco:
%	http://latex-exemplo.blogspot.com.br/2015/11/modelo-latex-para-dissertacoes-e-teses.html
%
%   CORREÇÕES APLICADAS (2026-04):
%   - Removida opção obsoleta 'usenames' do xcolor
%   - Removidos pacotes duplicados: listings, graphicx, booktabs
%   - Removido type1cm (obsoleto)
%   - Removido lipsum (não pertence a classe de produção)
%   - Corrigido \fancyhead[L] duplo (\rightmark sobrescrito)
%   - Removido \fontsize{60}{62} solto no escopo global
%   - Adicionada opção caption=false no subfig
%
%   CORREÇÕES APLICADAS (2026-10):
%   - Folha de rosto reescrita: texto de apresentação adaptado automaticamente
%     a Pré-Qualificação, Qualificação ou Defesa, de Mestrado ou Doutorado
%   - Novo campo \Disciplina (opcional), separado de \Tipoexame
%   - Campos \Coorientador, \Ingresso, \Linha e \Disciplina tornados opcionais
%   - Adicionado o pacote ifthen para as condicionais da folha de rosto
%
%   CONFORMIDADE COM O MANUAL DA BIBLIOTECA (2026-10-16):
%   - Fonte Times (newtxtext; mathptmx como alternativa), tamanho 12
%   - Recuo de parágrafo de 1,25 cm
%   - Legendas e fontes de ilustrações em tamanho 10 e espaçamento simples,
%     sem itálico; natureza do trabalho em espaçamento simples
%   - Paginação: folhas contadas a partir da folha de rosto e numeração
%     impressa somente a partir da Introdução (comandos \pretextual e \textual)
%   - Listas e elementos pré-textuais retirados do sumário
%   - Listas com travessão entre o número e o título (Figura 1 – Título)
%   - Títulos sem indicativo numérico centralizados (\postextual)
%   - Seções secundárias sem versalete (hierarquia por negrito e itálico)
%   - "Referências" (e não "Referências Bibliográficas"), em espaço simples,
%     separadas por uma linha em branco, alinhadas à esquerda
%   - Novos comandos: \apendice, \anexo, \folhaaprovacao, \fichacatalografica,
%     ambiente citacao (citação direta longa, recuo de 4 cm)
%   - Campos \Area e \SiglaPrograma (uso também pelo PPGP)
% ----------------------------------------------------------------------------------------- %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uninove-ppgi}[2026/10/16 Modelo Uninove PPGI/PPGP]
\LoadClass[12pt,oneside,a4paper]{book}

% ----------------------------------------- %
%
%	Carregando pacotes
%
% ----------------------------------------- %
\RequirePackage[T1]{fontenc}
\RequirePackage[english,brazil]{babel}		% idioma principal: português (o último)
\RequirePackage[utf8]{inputenc}				% codificações de caracteres especiais
\RequirePackage[pdftex]{graphicx}           % arquivos pdf/png como figuras
\RequirePackage{setspace}                   % espaçamento flexível
\RequirePackage{indentfirst}                % indentação do primeiro parágrafo
\RequirePackage{imakeidx}                   % índice remissivo
\RequirePackage[nottoc,notlof,notlot]{tocbibind} % só as Referências entram no sumário
\RequirePackage{listings}                   % código-fonte
\RequirePackage{titletoc}
\RequirePackage[fixlanguage]{babelbib}		% correção para bibliografia
\RequirePackage[font={footnotesize,stretch=1},format=plain,labelfont=bf,textfont=up]{caption}
\RequirePackage[svgnames,dvipsnames]{xcolor}
\RequirePackage[a4paper,top=3cm,bottom=2.0cm,left=3cm,right=2.0cm,headsep=1cm]{geometry} % margens ABNT
\RequirePackage[hyphens,spaces,obeyspaces]{url}
\RequirePackage[pdftex,plainpages=false,pdfpagelabels,pagebackref,colorlinks=true,citecolor=Black,linkcolor=Black,urlcolor=Black,filecolor=Black,bookmarksopen=true]{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage[alf]{abntex2cite} 			% citações autor-data (NBR 10520:2023)
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
% Versões não numeradas, para trabalhos com uma única lacuna e pergunta
\theoremstyle{definition}
\newtheorem*{lacuna*}{Lacuna de Pesquisa}
\newtheorem*{pergunta*}{Pergunta de Pesquisa}

\RequirePackage{mathtools}
\RequirePackage{tikz,tikz-3dplot}
\RequirePackage{capt-of}
\RequirePackage{pgfplots}
\RequirePackage{pgfgantt}
\RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{verbatim}
\RequirePackage{enumerate}
\RequirePackage{tabularx}
\RequirePackage[normalem]{ulem}
\RequirePackage{color, colortbl}
\RequirePackage[toc,page]{appendix}
\RequirePackage{booktabs, cellspace, multirow}
\RequirePackage{adjustbox}
\RequirePackage{array}
\RequirePackage{newfloat}
\RequirePackage[caption=false]{subfig}
\RequirePackage[portuguese, onelanguage, ruled, vlined, linesnumbered]{algorithm2e}
\RequirePackage{lmodern}                    % fonte de máquina de escrever e matemática
% Fonte do texto: Times (recomendação do manual: Arial ou Times New Roman, 12)
\IfFileExists{newtxtext.sty}
  {\RequirePackage{newtxtext}}
  {\RequirePackage{mathptmx}}
\RequirePackage{anyfontsize}
\RequirePackage{emptypage}
\RequirePackage{epigraph}
\RequirePackage{lscape}
\RequirePackage{xspace}
\RequirePackage{multicol}
\RequirePackage{leading}
\RequirePackage{makecell}
\RequirePackage{ifthen}
\RequirePackage{pdfpages}                   % ficha catalográfica em PDF

% ----------------------------------------- %
%
%	Configurações gerais
%
% ----------------------------------------- %

\usetikzlibrary{arrows,shapes,backgrounds,fit,trees,positioning,calc}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

% Nomes dos elementos (babel redefine \bibname como "Referências Bibliográficas")
\addto\captionsbrazil{%
  \renewcommand{\bibname}{Referências}%
  \renewcommand{\listfigurename}{Lista de figuras}%
  \renewcommand{\listtablename}{Lista de tabelas}%
  \renewcommand{\contentsname}{Sumário}%
}

% Quadros: ambiente flutuante próprio, numeração contínua
\DeclareFloatingEnvironment[listname=Lista de quadros,fileext=frm,placement={!ht},name=Quadro]{quadros}
\captionsetup[quadros]{labelformat=simple, labelsep=endash}
\captionsetup[figure]{labelformat=simple, labelsep=endash}
\captionsetup[table]{labelformat=simple, labelsep=endash}
\captionsetup{justification=centering}
\renewcommand*{\arraystretch}{1.1}

% Numeração contínua (1, 2, 3...) sem vínculo com o capítulo
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{quadros}{chapter}

% Listas: "Figura 1 – Título ........ página" (manual, item 10)
\renewcommand{\cftfigpresnum}{Figura~}
\renewcommand{\cftfigaftersnum}{~\textendash}
\cftsetindents{figure}{0em}{6.2em}
\renewcommand{\cfttabpresnum}{Tabela~}
\renewcommand{\cfttabaftersnum}{~\textendash}
\cftsetindents{table}{0em}{6.2em}
\DeclareCaptionListFormat{quadrolista}{Quadro~#2~\textendash}
\captionsetup[quadros]{listformat=quadrolista}
\def\l@quadros{\@dottedtocline{1}{0em}{6.2em}}

% Sumário (NBR 6027:2013): mesma hierarquia tipográfica do texto
% Primária em MAIÚSCULAS e negrito; secundária em negrito; quaternária em itálico
\titlecontents{chapter}[1.8em]{\addvspace{6pt}\bfseries}
  {\contentslabel{1.8em}\MakeUppercase}
  {\hspace*{-1.8em}\MakeUppercase}
  {\titlerule*[0.6pc]{.}\contentspage}
\renewcommand{\cftsecfont}{\bfseries}
\renewcommand{\cftsecpagefont}{\bfseries}
\renewcommand{\cftsubsubsecfont}{\itshape}
\renewcommand{\cftsubsubsecpagefont}{\itshape}

% local definitions (controle da posição do número da equação)
\newcommand{\numberequation}[1]{\addtocounter{equation}{#1}\tag{\theequation}}
\newcommand\mycommfont[1]{\textnormal{#1}}

\setlength\arrayrulewidth{0.7pt}
\setlength{\parindent}{1.25cm}              % manual, item 1.2.2
\setlength\aboverulesep{2pt}
\setlength\belowrulesep{2pt}
\setlength\cellspacetoplimit{3pt}
\setlength\cellspacebottomlimit{3pt}
\setlength{\headheight}{15.5pt}

\SetCommentSty{mycommfont}
\SetFuncSty{textsc}
\SetKwComment{Comment}{$\triangleright$\ }{}
\SetNlSty{bfseries}{\color{black}}{}
\SetArgSty{textnormal}
\SetKwBlock{Begin}{}{}
\pgfplotsset{compat=1.16}

% ----------------------------------------- %
%
%	Títulos (NBR 6024:2012 e manual, item 2)
%	Primária: NEGRITO E MAIÚSCULAS, em folha própria
%	Secundária: negrito; terciária: normal; quaternária: itálico
%	Títulos sem indicativo numérico: centralizados
%
% ----------------------------------------- %
\newcommand{\regularchapterstyle}{%
	\titleformat{\chapter}
	{\normalfont\large\bfseries}
	{\thechapter}
	{.5em}
	{\MakeUppercase}
	[\vspace{.5ex}\titlerule]
}

\newcommand{\centeredchapterstyle}{%
	\titleformat{\chapter}
	{\normalfont\large\bfseries\centering}
	{\centering\thechapter}
	{.5em}
	{\MakeUppercase}
	[\vspace{.5ex}\titlerule]
}

\titlespacing*{\chapter}{0pt}{-30pt}{6mm}

\titleformat{\section}
		{\normalfont\normalsize\bfseries}
		{\thesection}
		{.5em}
		{}
\titlespacing*{\section}{0pt}{6mm}{6mm}

\titleformat{\subsection}
		{\normalfont\normalsize}
		{\thesubsection}
		{.5em}
		{}
\titlespacing*{\subsection}{0pt}{6mm}{6mm}

\titleformat{\subsubsection}
		{\normalfont\normalsize\itshape}
		{\thesubsubsection}
		{.5em}
		{}
\titlespacing*{\subsubsection}{0pt}{6mm}{6mm}

% ----------------------------------------- %
%
%	Cabeçalho e paginação
%	Número no canto superior direito, a 2 cm da borda (manual, item 1.1)
%
% ----------------------------------------- %
\pagestyle{fancy}
\fancyhf{}
\fancyheadoffset{0cm}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\footnotesize\thepage}

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}
\fancypagestyle{plain}{%
	\fancyhf{}%
	\fancyhead[R]{\footnotesize\thepage}%
}
\let\uninove@psplain\ps@plain

% Elementos pré-textuais: folhas contadas, sem número impresso
\newcommand{\pretextual}{%
	\pagestyle{empty}%
	\let\ps@plain\ps@empty
	\centeredchapterstyle
}

% Elementos textuais: numeração impressa a partir da Introdução
\newcommand{\textual}{%
	\clearpage
	\let\ps@plain\uninove@psplain
	\pagestyle{fancy}%
	\regularchapterstyle
}

% Elementos pós-textuais e demais títulos sem indicativo numérico
\newcommand{\postextual}{%
	\clearpage
	\centeredchapterstyle
}

% ----------------------------------------- %
%
%	{amsthm}
%
% ----------------------------------------- %
\theoremstyle{definition}
\newtheorem{definition}{Definição}[chapter]
\newenvironment{definicao}[1]
	{\begin{definition}[#1]}
	{\end{definition}}

\newtheorem{proposition}{Proposição}[chapter]
\newenvironment{proposicao}
	{\begin{proposition}\itshape}
	{\end{proposition}}

\newtheorem{lacuna}{Lacuna de Pesquisa}
\newenvironment{lacunapesq}[1]
	{\begin{lacuna}[#1]}
	{\end{lacuna}}

\newtheorem{pergunta}{\textit{Pergunta}}[lacuna]
\newenvironment{perguntapesq}[1]
	{\begin{pergunta}[#1]}
	{\end{pergunta}}

\newtheorem{theorem}{Teorema}[chapter]
\newenvironment{teorema}[1]
	{\begin{theorem}[#1]\itshape}
	{\end{theorem}}

\DeclareMathOperator*{\argmin}{arg\,min}

\graphicspath{{./figuras/}}

% ----------------------------------------- %
%
%  Remissão "Citado na pág." nas referências
%  (auxílio de revisão; o modo final do revisao.sty a desativa)
%
% ----------------------------------------- %
\renewcommand*{\backreflastsep}{, }
\renewcommand*{\backreftwosep}{, }
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{{\tiny%
    \ifcase #1 Não citado.%
		\or Citado na p\'{a}g.~#2.%
		\else Citado nas p\'{a}gs. #2.%
    \fi%
    }}

% ----------------------------------------- %
%
%  Referências: espaço simples, uma linha em branco entre elas,
%  alinhadas à esquerda (manual, cap. 4, item 1.2)
%
% ----------------------------------------- %
% Endereços eletrônicos sem os sinais < > (NBR 6023:2018)
\def\UrlLeft{}\def\UrlRight{}

\AfterTheBibliography{%
	\singlespacing
	\setlength{\itemsep}{\baselineskip}%
	\setlength{\parsep}{0pt}%
}

\onehalfspacing

\setlength{\@fptop}{0pt}

\frenchspacing
\urlstyle{same}
\raggedbottom

% ------------------------------------------------------- %
%
%	Variáveis para criar capa e folha de rosto
%
%	Obrigatórias: \Universidade, \Programa, \Autor, \Titulo,
%	              \Ano, \Orientador, \Titulacao, \Tipoexame
%
%	Opcionais: \Coorientador, \Disciplina, \Ingresso, \Linha,
%	           \Area (padrão: Informática e Gestão do Conhecimento),
%	           \SiglaPrograma (padrão: PPGI), \Local (padrão: São Paulo)
%
%	Valores esperados:
%	  \Titulacao{Mestre}, \Titulacao{Mestra},
%	  \Titulacao{Doutor} ou \Titulacao{Doutora}
%	  \Tipoexame{Pré-Qualificação}, \Tipoexame{Qualificação}
%	  ou \Tipoexame{Defesa}
%
% ------------------------------------------------------- %

\newcommand{\Universidade}[1]{\newcommand{\universidade}{#1}}
\newcommand{\Programa}[1]{\newcommand{\programa}{#1}}
\newcommand{\Autor}[1]{\newcommand{\autor}{#1}}
\newcommand{\Titulo}[1]{\newcommand{\titulo}{#1}}
\newcommand{\Ano}[1]{\newcommand{\ano}{#1}}
\newcommand{\Orientador}[1]{\newcommand{\orientador}{#1}}
\newcommand{\Coorientador}[1]{\newcommand{\coorientador}{#1}}
\newcommand{\Ingresso}[1]{\newcommand{\ingresso}{#1}}
\newcommand{\Linha}[1]{\newcommand{\linha}{#1}}
\newcommand{\Titulacao}[1]{\newcommand{\titulacao}{#1}}
\newcommand{\Tipoexame}[1]{\newcommand{\tipoexame}{#1}}
\newcommand{\Disciplina}[1]{\newcommand{\disciplina}{#1}}

% Campos com valor padrão
\newcommand{\area}{Informática e Gestão do Conhecimento}
\newcommand{\Area}[1]{\renewcommand{\area}{#1}}
\newcommand{\siglaprograma}{PPGI}
\newcommand{\SiglaPrograma}[1]{\renewcommand{\siglaprograma}{#1}}
\newcommand{\local}{São Paulo}
\newcommand{\Local}[1]{\renewcommand{\local}{#1}}

% Termos derivados da titulação
\newcommand{\nivelcurso}{%
	\ifthenelse{\equal{\titulacao}{Doutor}\OR\equal{\titulacao}{Doutora}}%
		{Doutorado}{Mestrado}%
}
\newcommand{\tipotrabalho}{%
	\ifthenelse{\equal{\titulacao}{Doutor}\OR\equal{\titulacao}{Doutora}}%
		{Tese}{Dissertação}%
}

% ----------------------------------------- %
%
%	Natureza do trabalho (folha de rosto e folha de aprovação)
%	Redação conforme os exemplos do manual (cap. 2, item 3)
%
% ----------------------------------------- %
\newcommand{\textoapresentacao}{%
	\ifthenelse{\equal{\tipoexame}{Defesa}}%
	{%
		\tipotrabalho{} apresentada ao Programa de Pós-Graduação em \area{} (\siglaprograma) da Universidade Nove de Julho (UNINOVE), como requisito parcial para a obtenção do grau de \titulacao{} em \area.%
	}%
	{%
		Texto de \tipoexame{} de \nivelcurso\ifdefined\disciplina, elaborado na disciplina de \disciplina,\fi{} apresentado ao Programa de Pós-Graduação em \area{} (\siglaprograma) da Universidade Nove de Julho (UNINOVE), como requisito parcial para a obtenção do grau de \titulacao{} em \area.%
	}%
}

% ----------------------------------------- %
%
%	Capa (manual, cap. 2, item 1)
%
% ----------------------------------------- %
\newcommand{\capa}{%
	\begin{titlepage}
	\begin{center}
		\textbf{%
			\universidade\\
			\programa\\
			\vspace*{2cm}
			\autor\\
			\vspace*{4cm}
			\titulo\\
			\vspace*{\stretch{3}}
			\local\\
			\ano
		}
	\end{center}
	\end{titlepage}}

% ----------------------------------------- %
%
%	Folha de rosto (manual, cap. 2, item 3)
%	A contagem de folhas começa aqui (folha 1)
%
% ----------------------------------------- %
\newcommand{\folharosto}{%
	\clearpage
	\setcounter{page}{1}%
	\thispagestyle{empty}%
	\begin{center}
		\textbf{\autor}

		\vspace*{6cm}

		\textbf{\titulo}

		\vspace*{2cm}

		\begin{flushright}
			\begin{minipage}{.5\textwidth}
				\singlespacing\justifying
				\textoapresentacao
			\end{minipage}

			% Orientação e demais dados alinhados à direita, fora da caixa
			% de natureza, para que cada informação ocupe uma única linha
			\vspace{1em}
			{\singlespacing
			Orientador: \orientador\par
			\ifdefined\coorientador
				Coorientador: \coorientador\par
			\fi
			\ifdefined\ingresso
				\vspace{1em}Data de ingresso: \ingresso\par
			\fi
			\ifdefined\linha
				Linha de pesquisa: \linha\par
			\fi}
		\end{flushright}

		\vspace*{\stretch{3}}
		\textbf{\local\\ \ano}
	\end{center}
	\clearpage}

% Justificação dentro de minipage
\providecommand{\justifying}{\rightskip=0pt \leftskip=0pt \parfillskip=0pt plus 1fil}

% ----------------------------------------- %
%
%	Ficha catalográfica (verso da folha de rosto; somente na versão final)
%	Solicitar à biblioteca: biblioteca10@uninove.br (2 dias úteis)
%	Uso: \fichacatalografica{pre-textuais/ficha.pdf}
%
% ----------------------------------------- %
\newcommand{\fichacatalografica}[1]{%
	\IfFileExists{#1}%
		{\includepdf[pages=1,pagecommand={\thispagestyle{empty}}]{#1}}%
		{\clearpage\thispagestyle{empty}\vspace*{\fill}%
		 \begin{center}\fbox{\parbox[c][12.5cm][c]{7.5cm}{\centering
		 Ficha catalográfica\\elaborada pela biblioteca\\(arquivo #1 não encontrado)}}\end{center}%
		 \clearpage}%
}

% ----------------------------------------- %
%
%	Folha de aprovação (obrigatória na Defesa; manual, cap. 2, item 5)
%	Uso: \MembroBanca{Prof. Dr. Nome}{Instituição -- função}
%	     \DataAprovacao{__ de ______ de 2027}
%	     \folhaaprovacao
%
% ----------------------------------------- %
\newcommand{\uninove@banca}{}
\newcommand{\MembroBanca}[2]{%
	\g@addto@macro\uninove@banca{%
		\par\vspace{1.6cm}\noindent\rule{9cm}{0.4pt}\par
		\noindent #1\par\noindent #2\par}}
\newcommand{\dataaprovacao}{\local, \rule{0.5cm}{0.4pt} de \rule{2.5cm}{0.4pt} de \ano}
\newcommand{\DataAprovacao}[1]{\renewcommand{\dataaprovacao}{\local, #1}}
\newcommand{\folhaaprovacao}{%
	\clearpage\thispagestyle{empty}%
	\begin{center}
		\textbf{\autor}

		\vspace*{2cm}
		\textbf{\titulo}

		\vspace*{1cm}
		\begin{flushright}
			\begin{minipage}{.5\textwidth}
				\singlespacing\justifying\textoapresentacao
			\end{minipage}
		\end{flushright}

		\vspace*{1cm}
		\dataaprovacao

		{\singlespacing\uninove@banca}
	\end{center}
	\clearpage}

% ----------------------------------------- %
%
%	Palavras-chave e keywords
%	Separadas por ponto e vírgula, em minúsculas, finalizadas por ponto
%
% ----------------------------------------- %
\newcommand{\PalavrasChave}[1]{\newcommand{\palavraschave}{#1}}
\newcommand{\KeyWords}[1]{\newcommand{\keywords}{#1}}

% ----------------------------------------- %
%	Resumo e abstract (obrigatórios; NBR 6028:2021)
% ----------------------------------------- %
\newenvironment{resumo}
    {\chapter*{Resumo}\thispagestyle{empty}}
    {\par\vspace{1em}\noindent\textbf{Palavras-chave}: \palavraschave}

\newenvironment{abstract}
	{\chapter*{Abstract}\thispagestyle{empty}\begin{otherlanguage}{english}}
	{\par\vspace{1em}\noindent\textbf{Keywords}: \keywords\end{otherlanguage}}

% ----------------------------------------- %
%	Dedicatória e epígrafe: sem título (manual, cap. 2, itens 6 e 8)
% ----------------------------------------- %
\newenvironment{agradecimentos}
	{\chapter*{Agradecimentos}\thispagestyle{empty}}
	{}

\newenvironment{dedicatoria}
	{\clearpage\thispagestyle{empty}\vspace*{\fill}\begin{flushright}\begin{minipage}{.5\textwidth}\itshape}
	{\end{minipage}\end{flushright}\clearpage}

\newenvironment{epigrafe}
	{\clearpage\thispagestyle{empty}\vspace*{\fill}\begin{flushright}\begin{minipage}{.5\textwidth}}
	{\end{minipage}\end{flushright}\clearpage}

% ----------------------------------------- %
%	Resumo do capítulo
% ----------------------------------------- %
\newenvironment{resumocapitulo}
	{\begin{center}
		\begin{minipage}{1\textwidth}
		\textbf{Resumo do capítulo}\\\itshape}
	{\end{minipage}
	\end{center}}

% ----------------------------------------- %
%	Citação direta com mais de três linhas (NBR 10520:2023)
%	Recuo de 4 cm, fonte menor, espaço simples, sem aspas
% ----------------------------------------- %
\newenvironment{citacao}
	{\par\vspace{\baselineskip}\begin{list}{}{%
		\setlength{\leftmargin}{4cm}\setlength{\rightmargin}{0cm}%
		\setlength{\topsep}{0pt}\setlength{\parsep}{0pt}}%
	 \item[]\footnotesize\singlespacing}
	{\end{list}\par\vspace{\baselineskip}}

% ----------------------------------------- %
%	Listas de abreviaturas, siglas e símbolos
%	Elementos pré-textuais: não entram no sumário (manual, cap. 2, item 13)
% ----------------------------------------- %
\newenvironment{listaabreviaturas}
	{\chapter*{Lista de abreviaturas e siglas}
	\thispagestyle{empty}
	\noindent\begin{tabular}{@{}ll@{}}}
	{\end{tabular}}

\newcommand{\simbolos}[2]{%
	\section*{#1}
	\begin{tabular}{ll}
		#2
	\end{tabular}%
}%

\newenvironment{listasimbolos}
	{\chapter*{Lista de símbolos}
	\thispagestyle{empty}}
	{}

% ----------------------------------------- %
%	Links e fontes
% ----------------------------------------- %
\newcommand{\drawlink}[3]{%
	{\hypersetup{linkcolor=#1}\hyperref[#2]{#3}\hypersetup{linkcolor=NavyBlue}}%
}
\newcommand{\factorylinks}[3]{%
	\newcommand{#1}{\hypersetup{linkcolor=black}\hyperref[#2]{#3}\hypersetup{linkcolor=NavyBlue}}
}

% Fonte de ilustrações e tabelas: tamanho 10, espaço simples (manual, itens 4 e 5)
% Em tabelas (ambiente table), a fonte fica alinhada à esquerda, na primeira
% linha do rodapé, como determina o IBGE (Normas de apresentação tabular,
% 4.10). Em figuras e quadros, permanece centralizada.
\def\fonte@tabela{table}
\newcommand{\fonte}[1]{%
	\par\vspace{2pt}%
	{\footnotesize\singlespacing
	 \ifx\@captype\fonte@tabela\raggedright\else\centering\fi
	 Fonte: #1\par}}

\newcommand{\fontetabela}[1]{%
	{\footnotesize\singlespacing Fonte: #1}}

\newcommand{\amostra}[1]{%
	{\footnotesize $n$ = #1}}

\newcommand{\observacao}[1]{%
	{\textit{\textcolor{Blue}{#1}}\xspace}}

% Comandos antigos de marcação: mantidos por compatibilidade.
% Para novas revisões, usar \inserir, \remover e \notaORIENTADOR (revisao.sty).
\newcommand{\correcao}[1]{\textcolor{red}{\{#1\}}\xspace}
\newcommand{\tachado}[1]{{\textcolor{red}{\sout{#1}}\xspace}}

\newenvironment{prova}
	{\noindent \textbf{Prova:}}
	{}

% ----------------------------------------- %
%
%	Apêndices e anexos (manual, cap. 4, itens 3 e 4)
%	"APÊNDICE A – Título", em folha própria, numeração contínua
%	Uso: \apendice{Título}\label{ap:rotulo}   \anexo{Título}\label{an:rotulo}
%
% ----------------------------------------- %
\newcounter{apendice}
\renewcommand{\theapendice}{\Alph{apendice}}
\newcounter{anexo}
\renewcommand{\theanexo}{\Alph{anexo}}

\newcommand{\uninove@titulopos}[2]{%
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{#2}%
	\markboth{}{}%
	\vspace*{-30pt}%
	{\centering\normalfont\large\bfseries #1\par}%
	\vspace{.5ex}\titlerule\vspace{6mm}%
}
\newcommand{\apendice}[1]{%
	\refstepcounter{apendice}%
	\uninove@titulopos{APÊNDICE \theapendice{} \textendash{} #1}%
		{APÊNDICE \theapendice{} \textendash{} \texorpdfstring{\protect\NoCaseChange{#1}}{#1}}}
\newcommand{\anexo}[1]{%
	\refstepcounter{anexo}%
	\uninove@titulopos{ANEXO \theanexo{} \textendash{} #1}%
		{ANEXO \theanexo{} \textendash{} \texorpdfstring{\protect\NoCaseChange{#1}}{#1}}}

% Ambiente antigo (mantido por compatibilidade com textos já escritos)
\newcommand{\appendixtitle}{Apêndices}
\newenvironment{appendixenv}
	{
		\backmatter
		\appendix
		\chapter{\appendixtitle}
		\renewcommand{\appendixname}{Apêndice}
		\begin{subappendices}
		\renewcommand\thesection{\Alph{section}}
	}
	{
		\end{subappendices}
	}

\newenvironment{changemargin}[2]{%
	\begin{list}{}{%
		\setlength{\topsep}{0pt}%
		\setlength{\leftmargin}{#1}%
		\setlength{\rightmargin}{#2}%
		\setlength{\listparindent}{\parindent}%
		\setlength{\itemindent}{\parindent}%
		\setlength{\parsep}{\parskip}%
	}%
	\item[]}{\end{list}}
\endinput
