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


\newcommand{\precv}{
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
