%
% \brief ISI-SE template file.
%
% \author Luis Fernando Arcaro <luis.arcaro@sc.senai.br>
% \author Gabriel Mariano Marcelino <gabriel.marcelino@sc.senai.br>
%
% \version 0.0.1
%
% \date 2021/04/20
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isise}[2019/12/05 Modelo LaTeX ISI-SE]

% Forwards language to babel package
\DeclareOption{language}{\PassOptionsToClass{language}{babel}}

% Forwards all other options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Processes options
\ProcessOptions\relax

% Loads superclass
\LoadClass[12pt]{article}

% Requires common packets
\RequirePackage[a4paper,left=2cm,right=2cm,top=3.8cm,bottom=3cm,headheight=14.5pt]{geometry} % Configures page format and margins
\RequirePackage[utf8]{inputenc} % Sets file encoding
\RequirePackage[T1]{fontenc} % Sets font encoding
\RequirePackage{babel} % Sets language (brazil/english)
\RequirePackage[svgnames,table]{xcolor} % Used for assigning colors to text and tables
\RequirePackage[scaled]{helvet} % Imports the helvetica font family
\RequirePackage[helvet]{sfmath} % Imports the helvetica font family (math mode)
\RequirePackage{graphicx} % Used for inserting graphics
%\RequirePackage{svg} % Used for supporting SVG graphics  ======> ERROR!
\RequirePackage{fancyhdr} % Used for formatting headers
\RequirePackage{tikz} % Used e.g. to insert background images
\RequirePackage{etoolbox} % Used for formatting tables
\RequirePackage{enumitem} % Used for formatting items
\RequirePackage{float} % Used for positioning floating elements
\RequirePackage{cellspace} % Used for setting table cell internal spacing
\RequirePackage{makecell} % Used for creating multi-line table cells
\RequirePackage{multicol,multirow} % Used for creating multi-column/row table cells
\RequirePackage{tocloft} % Used for setting table of content titles' style
\RequirePackage{sectsty} % Used for setting section titles' style
\RequirePackage{titlecaps} % Used for setting section titles to upper case
\RequirePackage{titlesec} % Used for starting sections in new pages
\RequirePackage{indentfirst} % Used for indenting first paragraphs
\RequirePackage{caption} % Used for setting captions' style
\RequirePackage[printonlyused]{acronym} % Used for defining acronyms
\RequirePackage{lastpage} % Used for page numbering

% Language-dependant text definition
\newcommand*{\versiontext}{?}
\newcommand*{\definitionsandacronymstext}{?}
\newcommand*{\authorstext}{?}
\newcommand*{\datetext}{?}
\newcommand*{\changestext}{?}
\newcommand*{\pagetext}{?}
\newcommand*{\pageoftext}{?}
\newcommand*{\applicabledocumentstext}{?}
\addto{\captionsbrazil}{%
	\renewcommand*{\versiontext}{Versão}%
	\renewcommand*{\definitionsandacronymstext}{Definições e Acrônimos}%
	\renewcommand*{\authorstext}{Autor(es) \\ (Empresa)}%
	\renewcommand*{\datetext}{Data}%
	\renewcommand*{\changestext}{Resumo de Alterações}%
	\renewcommand*{\pagetext}{Página}%
	\renewcommand*{\pageoftext}{de}%
	\renewcommand*{\applicabledocumentstext}{Documentos Aplicáveis}%
	\renewcommand*{\contentsname}{Sumário}%
}
\addto{\captionsenglish}{%
	\renewcommand*{\versiontext}{Version}%
	\renewcommand*{\definitionsandacronymstext}{Definitions and Acronyms}%
	\renewcommand*{\authorstext}{Author(s) \\ (Organization)}%
	\renewcommand*{\datetext}{Date}%
	\renewcommand*{\changestext}{Change Summary}%
	\renewcommand*{\pagetext}{Page}%
	\renewcommand*{\pageoftext}{of}%
	\renewcommand*{\applicabledocumentstext}{Applicable Documents}%
	\renewcommand*{\contentsname}{Summary}%
}

% Sets default font family
\renewcommand\familydefault{\sfdefault}

% Sets sections' depths:
% 1) Section
% 1.1) SubSection
% 1.1.1) SubSubSection
% 1.1.1.1) Paragraph
% 1.1.1.1.1) SubParagraph
% 1.1.1.1.1.1) SubSubParagraph
\setcounter{secnumdepth}{6}
\newcommand{\subsubsubsection}[1]{\paragraph{#1}\mbox{}\\}
\newcommand{\subsubsubsubsection}[1]{\subparagraph{#1}\mbox{}\\}
\newcommand{\subsubsubsubsubsection}[1]{\subsubparagraph{#1}\mbox{}\\}

% Sets lists' depths
\setlistdepth{9}

% Sets depths for nested enumerations
\renewlist{enumerate}{enumerate}{9}
	\setlist[enumerate]{itemsep=0ex,partopsep=0ex,parsep=0ex,leftmargin=*}
	\setlist[enumerate,1]{label=\arabic*)}
	\setlist[enumerate,2]{label=\alph*)}
	\setlist[enumerate,3]{label=(\roman*)}
	\setlist[enumerate,4]{label=(\arabic*)}
	\setlist[enumerate,5]{label=(\Alph*)}
	\setlist[enumerate,6]{label=(\Roman*)}
	\setlist[enumerate,7]{label=\arabic*}
	\setlist[enumerate,8]{label=\alph*}
	\setlist[enumerate,9]{label=\roman*}

% Sets depths for nested itemizations
\renewlist{itemize}{itemize}{9}
	\setlist[itemize]{label=$\cdot$,itemsep=1ex,partopsep=0ex,parsep=0ex,leftmargin=*}
	\setlist[itemize,1]{label=\textbullet,leftmargin=*}
	\setlist[itemize,2]{label=$\circ$}
	\setlist[itemize,3]{label=$\ast$}
	\setlist[itemize,4]{label=$\dagger$}
	\setlist[itemize,5]{label=$\triangleright$}
	\setlist[itemize,6]{label=$\bigstar$}
	\setlist[itemize,7]{label=$\blacklozenge$}
	\setlist[itemize,8]{label=$\prime$}

% Sets depths for nested descriptions
\renewlist{description}{description}{1}
	\setlist[description]{itemsep=0ex,partopsep=0ex,parsep=0ex}

% Defines document colors
\definecolor{documentdatecolor}{rgb}{1,0.75,0}
\definecolor{toctitlecolor}{rgb}{1,0.75,0}
\definecolor{tableheaderbackgroundcolor}{rgb}{1,0.75,0}
\definecolor{tableheadertextcolor}{rgb}{1,1,1}

% Sets sections' font
\sectionfont{\MakeUppercase}

% Sets up captions' format
\captionsetup{font={small,singlespacing}}

% Sets table of content format
\setcounter{tocdepth}{3}
\renewcommand{\cfttoctitlefont}{\Large\bfseries\color{toctitlecolor}}
\renewcommand{\cftaftertoctitle}{\vspace{\baselineskip}}
\addtocontents{toc}{\protect\thispagestyle{fancy}}

% Command for creating decorated tables
\newcommand{\decoratedtable}{
	\renewcommand{\arraystretch}{1.75}
	\renewcommand\theadset{\def\arraystretch{.85}}
	\rowcolors{1}{\ifnumless{\rownum}{2}{tableheaderbackgroundcolor}{white}}{}
	\newcolumntype{L}[1]{>{\ifnumequal{\rownum}{1}{\color{tableheadertextcolor}}\raggedright}m{##1}}
	\newcolumntype{C}[1]{>{\ifnumequal{\rownum}{1}{\color{tableheadertextcolor}}\centering}m{##1}}
	\newcolumntype{R}[1]{>{\ifnumequal{\rownum}{1}{\color{tableheadertextcolor}}\raggedleft}m{##1}}
	\newcolumntype{M}[1]{>{\ifnumequal{\rownum}{1}{\color{tableheadertextcolor}}}m{##1}}
	\newcolumntype{P}[1]{>{\ifnumequal{\rownum}{1}{\color{tableheadertextcolor}}}p{##1}}
}

% Sets table cell format
\newcommand{\thcell}[1]{
    \cellcolor{tableheaderbackgroundcolor}\textbf{\textcolor{white}{#1}}
}

% Sets tables' formatting
\AtBeginEnvironment{tabular}{\setlength\arrayrulewidth{1px}}
\AtBeginEnvironment{longtable}{\setlength\arrayrulewidth{1px}}
\setlength{\cellspacetoplimit}{5pt}
\setlength{\cellspacebottomlimit}{5pt}
\renewcommand\theadfont{\bfseries}

% Set List of Figures formatting
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\cftloftitlefont}{\Large\bfseries\color{toctitlecolor}}
\setlength{\cftfigindent}{0pt} % left aligned fig entries
\renewcommand{\cftfigpresnum}{Figure } % put before the number
\addtolength{\cftfignumwidth}{3em} % extra space for \cftpresnum

% Set List of Tables formatting
\renewcommand{\listtablename}{List of Tables}
\renewcommand{\cftlottitlefont}{\Large\bfseries\color{toctitlecolor}}
\setlength{\cfttabindent}{0pt} % left aligned tab entries
\renewcommand{\cfttabpresnum}{Table } % put before the number
\addtolength{\cfttabnumwidth}{3em} % extra space for \cftpresnum

% Starts sections in new pages
\newcommand{\sectionbreak}{\clearpage}

% Clears style for the first page
\pagestyle{empty}

% Sets hyphenation parameters
\hyphenpenalty=500
\hbadness=50000
\vbadness=50000
\setlength{\emergencystretch}{10pt}

% Verifies supported languages
\AtBeginDocument{%
	\ifthenelse{\equal{\languagename}{\string brazil}}{}{%
		\ifthenelse{\equal{\languagename}{\string english}}{}{%
			\PackageError{}{Language not supported}{}%
		}%
	}%
}

% Cover generation macro
\newcommand{\generatecover}{%

	% Creates background overlay
	\tikz[remember picture,overlay] \node[anchor=north west,inner sep=0pt] at (current page.north west){\includegraphics[width=\paperwidth]{figures/cover_ufsc.png}};

	% Adds filling space
	\vfill

	% Document date
	\begin{minipage}[c]{0.9\textwidth}
		\flushleft
		\fontsize{18pt}{20pt}\color{documentdatecolor}\selectfont\textit{\today}
	\end{minipage}

	% Adds interspace
	\vspace{2\baselineskip}

	% Project name
	\begin{minipage}[c]{0.9\textwidth}
		\flushleft
		\fontsize{40pt}{45pt}\color{white}\selectfont\textbf{\textprojectname}
	\end{minipage}

	% Adds interspace
	\vspace{2\baselineskip}

	% Document type
	\begin{minipage}[c]{0.9\textwidth}
		\flushleft
		\fontsize{22pt}{30pt}\color{white}\selectfont\textit{\textdocumentname}
	\end{minipage}

	% Adds interspace
	\vspace{6\baselineskip}

	% Logo
	\begin{minipage}[c]{0.9\textwidth}
        \flushleft
        \includegraphics[width=12.5cm]{figures/catarina-logos.png}

        \vspace{0.5cm}
        \fontsize{14pt}{30pt}\color{white}\selectfont\textdocumentcode\_\textdocumentrevision
        \vspace{0.1cm}
	\end{minipage}

	% Adds filling space
	\vfill

	% Starts new page
	\newpage
}

% Document body formatting macro
\newcommand{\formatdocumentbody}{%

	% Sets page numbering disposition style
	\pagestyle{fancy}
	\fancyhf{} % Removes header and footer content
	\renewcommand{\headrulewidth}{0pt} % Removes header ruler

	% Creates header
	\lhead{\tikz[remember picture,overlay] \node[opacity=0.5,anchor=north west,inner sep=0pt] at (current page.north west){\includegraphics[width=\paperwidth]{figures/header_ufsc.png}};}

	% Creates footer
	\lfoot{
		\scriptsize
		\renewcommand{\arraystretch}{1.75}
		\begin{tabular}{|m{7.5cm}|>{\centering\arraybackslash}m{2cm}|>{\centering\arraybackslash}m{3.5cm}|>{\centering\arraybackslash}m{2cm}|}
		\hline
		\textdocumentcode~-~\textdocumentplainname & \versiontext:~\textdocumentrevision & \datetext:~\today & \pagetext~\thepage~\pageoftext~\pageref{LastPage} \\
		\hline
		\end{tabular}%
	}
}

% Redefine the plain page style
\fancypagestyle{plain}{%
    % Sets page numbering disposition style
    \pagestyle{fancy}
    \fancyhf{}%
    \renewcommand{\headrulewidth}{0pt} % Removes header ruler

    % Creates header
    \lhead{\tikz[remember picture,overlay] \node[opacity=0.5,anchor=north west,inner sep=0pt] at (current page.north west){\includegraphics[width=\paperwidth]{figures/header_ufsc.png}};}

    % Creates footer
    \lfoot{
        \scriptsize
        \renewcommand{\arraystretch}{1.75}
        \begin{tabular}{|m{8cm}|>{\centering\arraybackslash}m{1.5cm}|>{\centering\arraybackslash}m{3.5cm}|>{\centering\arraybackslash}m{2cm}|}
        \hline
        \textdocumentcode~-~\textdocumentplainname & \versiontext:~\textdocumentrevision & \datetext:~\today & \pagetext~\thepage~\pageoftext~\pageref{LastPage} \\
        \hline
        \end{tabular}%
    }
}

% Definitions and acronyms generation macro
\newcommand{\generatedefinitionsandacronyms}{%

	% Prints acronym list
	{\noindent\cfttoctitlefont\bfseries\definitionsandacronymstext}
	\vspace{\baselineskip}
	\input{header/acronyms}
	\input{header/acronyms_used}
    \addcontentsline{toc}{section}{Definitions and Acronyms}

	% Starts new page
	\newpage
}

% Summary generation macro
\newcommand{\generatesummary}{%

	% Shows table of contents
	\tableofcontents

	% Starts new page
	\newpage
}

% List of figures generation macro
\newcommand{\generatelistoffigures}{%

    % Shows list of figures
    \listoffigures
%    \addcontentsline{toc}{section}{List of Figures}

    % Starts new page
    \newpage
}

% List of tables generation macro
\newcommand{\generatelistoftables}{%

    % Shows list of tables
    \listoftables
%    \addcontentsline{toc}{section}{List of Tables}

    % Starts new page
    \newpage
}

% Document content starting macro
\newcommand{\startdocumentcontent}{%

	% Resets acronyms
	\acresetall

	% Inputs used acronyms
	\input{header/acronyms_used}
}

% Document content finishing macro
\newcommand{\finishdocumentcontent}{%
}

% References generation macro
\newcommand{\generatereferences}{%

	% Sets bibliography style
	\bibliographystyle{abntex2-num}
}
