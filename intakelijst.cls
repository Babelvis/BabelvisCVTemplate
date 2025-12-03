% intakelijst LaTeX class
% Copyright © 2025-2025 Bas Magre <bas.magre@babelvis.nl>
% Licensed under the 3-Clause BSD License. See LICENSE file for details.
%

%-------------------------------------------------------------------------------
%                           CLASS NAME AND VERSION
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\LoadClass{template/babelvis}
\ProvidesClass{intakelijst}[2025/11/12 Babelvis intakelijst class]

\newcommand{\preintake}{
    % enable links
    \RequirePackage[hidelinks]{hyperref}
    \RequirePackage[a4paper]{geometry}

    % reset the value for alignment
    \setlength{\sidebarwidth}{0.08\paperwidth}
    \setlength{\topbottommargin}{0.02\paperheight}
    \setlength{\leftrightmargin}{0.02\paperwidth}
    \setlength{\sidebartextwidth}{\sidebarwidth - 2\leftrightmargin}
    \setlength{\profilepicsize}{0.7\sidebarwidth}
    \setlength{\datecolwidth}{0.17\textwidth}

    \newlength\intakeitemcolwidth
    \setlength{\intakeitemcolwidth}{0.3\textwidth}

    \geometry{
        top=\topbottommargin,
        bottom=\topbottommargin,
        left=\sidebarwidth + \leftrightmargin,
        right=\leftrightmargin,
    }
}

\newcommand{\intaketablespace}{3.0}

\newcommand{\intakeitem}[4]{%
	\parbox[t]{\intakeitemcolwidth}{\raggedright \textbf{#1}} &%
	\parbox[t]{0.98\textwidth-\intakeitemcolwidth}{%
		
		\if\relax\detokenize{#4}\relax%
		 	% no description
		\else
			\textcolor{itemtextcolor}{#4}%\vspace{\parsep}%
		\fi

		\if\relax\detokenize{#3}\relax%
			\parbox[t]{\linewidth-\widthof{\footnotesize}-1em}{\raggedright \textit{#2}}%
		 	% no location
		\else
			\parbox[t]{\linewidth-\widthof{\footnotesize #3}-1em}{\raggedright \textit{#2}}%
            \hfill {\footnotesize#3}%
		\fi

	}\\
}


\newcommand{\intakeitemdots}[3]{%
	\parbox[t]{\intakeitemcolwidth}{\raggedright \textbf{#1}} &%
	\parbox[t]{0.98\textwidth-\intakeitemcolwidth}{%
    \if\relax\detokenize{#2}\relax%
        % no description	    
    \else
        \textcolor{itemtextcolor}{#2} \par
    \fi
    \foreach \x [count=\xi] in {#3} {\parbox[t]{\linewidth-\widthof{\footnotesize}-1em}{\raggedright \textit\dottext{\x}} \par}%
	}\\
}

\newcommand{\intakestartsection}[2]{%
    \apptocmd{#1}{\cvsection{#2}}{}{}%
    \apptocmd{#1}{\dotssection}{}{}%
    \apptocmd{#1}{\begin{cvtable}[\intaketablespace]}{}{}%
}

\newcommand{\intakeendsection}[1]{%
    \apptocmd{#1}{\end{cvtable}}{}{}%
}

\newcommand{\addintakeitem}[5]{%
	\apptocmd{#1}{\intakeitem{#2}{#3}{#4}{#5}}{}{}%
}

\newcommand{\addintakeitemdots}[4]{%
	\apptocmd{#1}{\intakeitemdots{#2}{#3}{#4}}{}{}%
}

\newcommand{\dottext}[1]{
    \color{skillbg}
    {\scriptsize\faCircle}
    \color{itemtextcolor}
    \footnotesize\textit{#1}
}

\newcommand{\dotssection}{
    \dottext{n.v.t.}
    \dottext{niet over nagedacht}
    \dottext{niet toegepast}
    \dottext{gedeeltelijk toegepast}
    \dottext{volledige toegepast}
}

\newcommand{\dotsdefault}{
    \dottext{n.v.t.}
    \dottext{niet over nagedacht}
    \dottext{niet toegepast}
    \dottext{gedeeltelijk toegepast}
    \dottext{volledige toegepast}
}

\newcommand{\dotspercentage}{
    \dottext{10\%},
    \dottext{20\%},
    \dottext{30\%},
    \dottext{40\%},
    \dottext{50\%},
    \dottext{60\%},
    \dottext{70\%},
    \dottext{80\%},
    \dottext{90\%},
    \dottext{100\%}
}

\newcommand{\makesidebar}[1]{%
	\begin{sidebar}
		% most sidebar commands end with \par; increase space between them
		\setlength{\parskip}{1ex}
        \begin{minipage}[]{297mm}
            \color{maincolor}
            \rotatebox{90}{%
                \includegraphics[width=45mm]{template/pics/logo_babelvis.png}%
            }
            \par
            \vspace{80mm}
            \begin{tabular}{@{}l@{}}
                \rotatebox{90}{%
                    
                    \textbf{\fontsize{10mm}{1.55mm}\selectfont {#1}}
                    
                }
            \end{tabular}
            \vspace{80mm}
        \end{minipage}
	\end{sidebar}
}
