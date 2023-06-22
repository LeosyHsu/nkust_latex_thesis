% author: Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan]
% version: 1.3

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NKUSTthesis}[2021/07/24 Your class description]

% Derived from book class
% \DeclareRobustCommand{\@typeen}{Master}
% \DeclareRobustCommand{\@typezh}{碩士}
% \DeclareRobustCommand{\@classen}{Thesis}
% \DeclareRobustCommand{\@classzh}{論文}
% \DeclareOption{phd}{\gdef\@degreeen{Doctoral}\gdef\@degreezh{博士}\gdef\@classen{Dissertation}}
% \DeclareOption{proposal}{\gdef\@degreeen{Proposal for Doctoral}\gdef\@degreezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass[a4paper,12pt,oneside]{book}

% Required packages
\RequirePackage{setspace}
\RequirePackage{pdfpages}
\RequirePackage{etoolbox}


\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}% LoF
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}% LoT
% \xpatchcmd{\@chapter}{%
% \addtocontents{lof}{\protect\addvspace{10\p@}}%
% \addtocontents{lot}{\protect\addvspace{10\p@}}%
% }{}{}{}



% Declarations
\newcommand{\puniversity}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\newcommand{\pcollege}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\newcommand{\pinstitute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\newcommand{\pclass}[2]{\gdef\@calssen{#1}\gdef\@classzh{#2}}
\newcommand{\pdegree}[2]{\gdef\@degreeen{#1}\gdef\@degreezh{#2}}
\newcommand{\pmajor}[1]{\gdef\@major{#1}}
\newcommand{\ptitle}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\newcommand{\pauthor}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\newcommand{\pstudentid}[1]{\gdef\@studentid{#1}}
\newcommand{\padvisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\newcommand{\pdefenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\newcommand{\pdefensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\newcommand{\pdefenseday}[1]{\gdef\@day{#1}}
\newcommand{\pdoi}[1]{\gdef\@doi{#1}}
\newcommand{\pkeywords}[2]{\gdef\@keywordsen{#1}\gdef\@keywordszh{#2}}

 

% 中文摘要
\newenvironment{abstractzh}
{\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{摘要}
\begin{center}
  \large
  \begin{singlespace}
    \@universityzh \\
    \@institutezh \\
    \@degreezh \\[0.5cm]
    \textbf{\@titlezh} \\[0.5cm]
  \end{singlespace}
  \begin{singlespace}
    \begin{minipage}{0.4\textwidth}
        \begin{flushleft}
            學生：\@authorzh
        \end{flushleft}
    \end{minipage}
    \begin{minipage}{0.5\textwidth}
        \begin{flushright}
            指導教授：\@advisorzh \hspace{0.1cm}博士
        \end{flushright}
    \end{minipage}
  \end{singlespace}
  \LARGE {\makebox[4em][s]{摘要}} \\[0.5cm]
\end{center}
\normalsize}
{\begin{flushleft}
\textbf{關鍵字}： \@keywordszh
\end{flushleft}}

% 英文摘要
\newenvironment{abstracten}
{\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{Abstract}
\begin{center}
  \large
  \begin{singlespace}
    \@universityen \\
    \@instituteen \\
    \@degreeen \\[0.5cm]
    \textbf{\@titleen}\\[0.5cm]
  \end{singlespace}
  \begin{singlespace}
    \begin{minipage}{0.4\textwidth}
        \begin{flushleft}
            Student：\@authoren
        \end{flushleft}
    \end{minipage}
    \begin{minipage}{0.5\textwidth}
        \begin{flushright}
            Advisor：\@advisoren \hspace{0.1cm}Ph.D
        \end{flushright}
    \end{minipage}
  \end{singlespace}
  \LARGE {\makebox[4em][s]{Abstract}} \\[0.5cm]
\end{center}
\normalsize}
{\begin{flushleft}
\textbf{Keywords}： \@keywordsen
\end{flushleft}}

% 誌謝
\newenvironment{acknowledgements}
{\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{誌謝}
\begin{center}
  \LARGE
  \makebox[4em][s]{誌謝} \\[0.5cm]
\end{center}
\normalsize}
{\begin{doublespace}
  \begin{flushright}
\@authorzh\hspace{5mm}謹誌于 \\
\@institutezh \\
中華民國\zhnumber{\@yearzh}年\zhnumber{\@monthzh}月
\end{flushright}
\end{doublespace}}



\setcounter{tocdepth}{2}
\pagestyle{plain}
\@setspacing

