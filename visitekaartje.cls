% visitekaartje LaTeX class
% Copyright © 2025-2025 Bas Magre <bas.magre@babelvis.nl>
% Licensed under the 3-Clause BSD License. See LICENSE file for details.
%

%-------------------------------------------------------------------------------
%                           CLASS NAME AND VERSION
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\LoadClass{template/babelvis}
\ProvidesClass{visitekaartje}[2025/11/12 Babelvis visitekaartje class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

% NOTE: ordering in sidebar will mimic the following order
\cvnameprofile{\Firstname \Space \Lastname}
% email address
\cvmail{\Email}
% phone number
\cvphone{\Mobile}
% personal website
\cvsite{\Web}
% short address/location, use \newline if more than 1 line is required
\cvaddress{\Address}

\newcommand{\drawLogoBG}{%
	\AddToShipoutPictureBG*{%
		\begin{tikzpicture}[remember picture, overlay]
			\node[
				rectangle,
				fill=sidecolor,
				anchor=north west,
                minimum width=18mm,
				minimum height=85mm,
			]{};%
		\end{tikzpicture}%
	}%
}%

% reset the value for sidebartextwidth (needed for displaying icontable correct)
\let\sidebartextwidth\relax
\newlength\sidebartextwidth
\setlength{\sidebartextwidth}{42mm}

\newcommand{\previsitekaartje}{
    \RequirePackage{xcolor}
    \RequirePackage{qrcode}
    \RequirePackage{rotating}
    \RequirePackage{nunito}
    \RequirePackage[
        paperheight=55mm,paperwidth=85mm, margin=5mm
    ]{geometry}

    \pagestyle{empty}
}


\newcommand{\makevisitekaartje}{

    \drawLogoBG
    \begin{minipage}[t]{15mm}
        \vspace{-3.5mm}%
        \color{maincolor}
        \rotatebox{90}{%
			    \includegraphics[width=45mm]{template/pics/logo_babelvis.png}%
        }
    \end{minipage}
    \begin{minipage}[t]{42mm}
        \vspace{-2mm}%
        \footnotesize
        \begin{flushleft}
            \small
            \begin{icontable}[2]{1.7em}{0.6em}
                \personaldata
            \end{icontable}
        \end{flushleft}
    \end{minipage}
    \begin{minipage}[t]{15mm}
        \vspace{25mm}%
        \qrcode[height=15mm]{MECARD:N:\Lastname,\Firstname;URL:\Web;EMAIL:\Email;TEL:\Mobile;}
    \end{minipage}

    \newpage
    \color{maincolor}
    \begin{minipage}[t]{75mm}
        \begin{center}
            \vspace{7mm}
            \includegraphics[width=75mm]{template/pics/logo_babelvis.png}
        \end{center}
        \begin{center}
            \vspace{-4.5mm}
            \textbf{\fontsize{3.50mm}{1.55mm}\selectfont IT die jouw groei versnelt}
        \end{center}
        \begin{center}
            \vspace{-4.5mm}
            \textit{\fontsize{2.50mm}{1.55mm}\selectfont Veilig, betrouwbaar en Europees}
        \end{center}
    \end{minipage}
}
