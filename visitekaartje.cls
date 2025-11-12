% visitekaartje LaTeX class
% Copyright © 2025-2025 Bas Magre <bas.magre@babelvis.nl>
% Licensed under the 3-Clause BSD License. See LICENSE file for details.
%

%-------------------------------------------------------------------------------
%                           CLASS NAME AND VERSION
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\LoadClass{template/babelviscv}
\ProvidesClass{visitekaartje}[2025/08/25 CV class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

% \usepackage[showframe]{geometry}

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
				minimum width=20mm,
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
    \usepackage{xcolor}
    \usepackage{qrcode}
    \usepackage{rotating}
    \usepackage{nunito}

    \setstocksize{55mm}{85mm} % UK Stock size
    \setpagecc{55mm}{85mm}{*}
    \settypeblocksize{45mm}{75mm}{*}
    \setulmargins{5mm}{*}{*}
    \setlrmargins{5mm}{*}{*}

    \setheadfoot{0.1pt}{0.1pt}
    \setheaderspaces{1pt}{*}{*}

    \checkandfixthelayout[fixed]

    \pagestyle{empty}
}


\newcommand{\makevisitekaartje}{

    \drawLogoBG
    \noindent
    % \textbf{\Name}\\
    % \tiny subtitle \hfill {\color{gray}Division / Employer}\\ 
    % \rule{74mm}{0mm}\\
    \begin{minipage}[t]{15mm}

        \vspace{-3mm}%
        \color{maincolor}
        \rotatebox{90}{%
			\includegraphics[width=43mm]{template/pics/logo_babelvis.png}%
        }
        \rotatebox{90}{
            % \begin{center}
                \textbf{\fontsize{3.50mm}{3.55mm}\selectfont IT die jouw groei versnelt}
            % \end{center}
        }
    \end{minipage}
    \begin{minipage}[t]{42mm}
        \vspace{-0mm}%
        \footnotesize
        \begin{flushleft}
            \begin{icontable}[2]{1.7em}{0.4em}
                \personaldata
            \end{icontable}
        \end{flushleft}
    \end{minipage}
    % \rule{74mm}{0mm}\\
    % \hspace{1mm}
    \begin{minipage}[t]{15mm}
        \vspace{25mm}%
        \qrcode[height=15mm]{MECARD:N:\Lastname,\Firstname;URL:\Web;EMAIL:\Email;TEL:\Mobile;}
    \end{minipage}

    \newpage
        
    \begin{minipage}[b]{75mm}
        \color{maincolor}
        \vspace{10mm}
        \hspace{-6mm}
        \includegraphics[width=75mm]{template/pics/logo_babelvis.png}%
    \end{minipage}
    \begin{minipage}[t]{75mm}
        \vspace{-3mm}%
        \color{maincolor}
        \hspace{15mm}
        \textbf{\fontsize{3.50mm}{8.55mm}\selectfont IT die jouw groei versnelt}
    \end{minipage}
    \begin{minipage}[t]{75mm}
        \vspace{-3mm}%
        \color{maincolor}
        \hspace{17mm}
        \textit{\fontsize{2.50mm}{1.55mm}\selectfont Veilig, betrouwbaar en Europees}    
    \end{minipage}
}
