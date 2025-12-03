% babelviscv LaTeX class
% Copyright © 2025-2025 Bas Magre <bas.magre@babelvis.nl>
% Licensed under the 3-Clause BSD License. See LICENSE file for details.
%

%-------------------------------------------------------------------------------
%                           CLASS NAME AND VERSION
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\LoadClass[subdirectory=template/]{template/babelvis}
\ProvidesClass{babelviscv}[2025/11/12 Babelvis babelviscv class]

% remove headers and footers
\pagestyle{empty}

% globally disable paragraph indentation
\setlength{\parindent}{0pt}

\newcommand{\precv}{
    % enable links
    \RequirePackage[hidelinks]{hyperref}
    \RequirePackage[a4paper]{geometry}



    % reset the value for alignment
    \setlength{\sidebarwidth}{0.34\paperwidth}
    \setlength{\topbottommargin}{0.02\paperheight}
    \setlength{\leftrightmargin}{0.02\paperwidth}
    \setlength{\sidebartextwidth}{\sidebarwidth - 2\leftrightmargin}
    \setlength{\profilepicsize}{0.7\sidebarwidth}
    \setlength{\datecolwidth}{0.17\textwidth}

    \geometry{
        top=\topbottommargin,
        bottom=\topbottommargin,
        left=\sidebarwidth + \leftrightmargin,
        right=\leftrightmargin,
    }
}

% provide user interface for easily adding new sections in side bars
% default: empty sidebar
\newcommand{\frontsidebar}{}
\newcommand{\backsidebar}{}
\newcommand{\addtofrontsidebar}[1]{\apptocmd{\frontsidebar}{#1}{}{}}
\newcommand{\addtobacksidebar}[1]{\apptocmd{\backsidebar}{#1}{}{}}

\newcommand{\backsite}{}
\newcommand{\addtobackside}[1]{\apptocmd{\backsite}{#1}{}{}}

\newcommand{\makefrontsidebar}{%
	\begin{sidebar}
		% most sidebar commands end with \par; increase space between them
		\setlength{\parskip}{1ex}

		% insert logo
		\begin{figure}\centering%
			\includegraphics[align=c, width=\logowidth]{{\subdirectory}pics/logo_babelvis.png}%
		\end{figure}
		\vspace*{\logospace}%

		% insert profile picture
		\plotprofilepicture

		% name and job - when \nameandjobposition = 'after'
		\centering\nameandjob

		% personal information
		\sidesection{Personalia}
		\begin{icontable}[2]{1.7em}{0.4em}
			\personaldata
		\end{icontable}

		% social network accounts incl. proper hyperlinks
		\sidesection{Social Network}
		\begin{icontable}[1]{1.7em}{0.4em}
			\socialnetworkdata
		\end{icontable}

		% add Competenties to sidebar on first page
		\sidesection{Competenties}
			\competenciesdata

		\frontsidebar
	\end{sidebar}
}

\newcommand{\makefront}{%
	\cvsection{Profiel}
	\profieldata

	\cvsection{Werkervaring}
	\werkervaringdata
}

\newcommand{\makebacksidebar}{%
	\begin{sidebar}
		% make sure there is no space at top
		\setlength{\parskip}{1ex}
		
		\sidesection{Vaardigheden}
		\vaardighedendata

		\sidesection{Talen}
		\languageskilldata

		% user definitions
		\backsidebar
	\end{sidebar}
}

\newcommand{\makeback}{%
	\cvsection{Opleidingen}
		\begin{cvtable}[\cvtablespace]
			\opleidingdata
		\end{cvtable}

	\cvsection{Cursussen}
		\begin{cvtable}[\cvtablespace]
			\cursusdata
		\end{cvtable}

	\cvsection{Nevenactiviteiten}
		\nevenactiviteitendata

	\iftoggle{showwatandereovermijzeggen}{	
		\cvsection{Wat andere over mij zeggen}
			\begin{cvtable}[2]
				\watandereovermijzeggendata
			\end{cvtable}
	}
	
	% user definitions
	\backsite

	\cvsignature
}

\newcommand{\makecv}{
	% FRONT
	\makefrontsidebar
	\makefront

	\newpage

	% BACK
	\makebacksidebar
	\makeback
}