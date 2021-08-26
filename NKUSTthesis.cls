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
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass[a4paper,12pt,oneside]{book}

% Required packages
\RequirePackage[left=3cm,right=3cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{zhnumber}
\RequirePackage{setspace}
\RequirePackage{pdfpages}
\RequirePackage[center]{titlesec}
\RequirePackage{CJKnumb}



% Used packages
\usepackage{multirow}
\usepackage{array}
\usepackage{longtable}
\usepackage{subcaption}
\usepackage[nounderscore]{syntax}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{subcaption}
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\usepackage{enumerate}
\usepackage{dsfont}
\usepackage{ulem}
\usepackage{mathtools}
\usepackage{tikz}                   % draw adjacency table and arrangement tree
\usetikzlibrary{calc,matrix,decorations.markings,decorations.pathreplacing,decorations.text}
\usetikzlibrary{arrows,shapes,chains}
\usetikzlibrary{automata,arrows.meta,positioning} % draw states
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}


% hyperlink
\usepackage[hidelinks]{hyperref}

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{0.88cm}

% prevent placing floats before a section
\usepackage[section]{placeins}
\let\Oldsubsection\subsection
\renewcommand{\subsection}{\FloatBarrier\Oldsubsection}

% graphics
\usepackage{graphicx}
\graphicspath{ {./figures/} }

% graphics caption ':' -> ' '
\usepackage{caption}
\captionsetup{labelsep=quad}


% source code highlighting
\usepackage{listings}
\lstset{
  numbers=none,
  captionpos=b,
  tabsize=2,
  basicstyle=\small,
  frame = single
}

% bibliography
% \usepackage[redeflists]{IEEEtrantools}
\usepackage[backend=biber,sorting=none,style=ieee,seconds=true]{biblatex}
\addbibresource{reference.bib}

% \usepackage[sorting=none,backend=biber]{biblatex}
% \addbibresource{reference.bib}


% watermark
\usepackage{background}
\ifdefined\withwatermark
  \backgroundsetup{
      %contents={\includegraphics[]{logo.png}},
      %scale=0.33,
      contents={\includegraphics[]{watermark.png}},
      scale=1,
      opacity=0.3,
      angle=0
  }
\else
  \backgroundsetup{contents={}}
\fi



% setup title format
\titleformat{\chapter}{\centering\Huge\bfseries}{\,\CJKnumber\thechapter\,、}{1em}{}
\titleformat{\section}{\raggedright\Large\bfseries}{\,\thesection\,}{1em}{}
\titleformat{\subsection}{\raggedright\large\bfseries}{\,\thesubsection\,}{1em}{}
%
\titlespacing*{\chapter}{0pt}{0pt}{40pt}
% toc format
\usepackage{titletoc}
\usepackage{xpatch}
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}% LoF
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}% LoT
\titlecontents{chapter}[0em]{}{\CJKnumber{\thecontentslabel}、\quad}{}{\titlerule*[1em]{}\contentspage}
\renewcommand{\contentsname}{目錄}
\renewcommand{\tablename}{表}
\renewcommand{\listtablename}{表目錄}
\renewcommand{\figurename}{圖}
\renewcommand{\listfigurename}{圖目錄}


% setup font
\defaultfontfeatures{AutoFakeBold=2.5,AutoFakeSlant=.2}
\setCJKmainfont[
  Path={./fonts/},
  % AutoFakeBold=true,
  % AutoFakeSlant=true
]{kaiu}       % 標楷體
% \setCJKmainfont[AutoFakeBold=3,AutoFakeSlant=.4]{DFKai-SB}       % 標楷體

% \setCJKmainfont{PMingLiU}       % 新細明體
% \setCJKmonofont{PMingLiU}        % 細明體
% Times New Roman
\setmainfont[
  Path={./fonts/},
  BoldFont={timesbd},
  ItalicFont={timesi},
  BoldItalicFont={timesbi}
]{times}   % rm

% \setmainfont{Times New Roman}   % rm
% \setsansfont{Arial}             % sf
% \setmonofont{Courier New}       % tt



% Declarations
\newcommand{\puniversity}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\newcommand{\pcollege}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\newcommand{\pinstitute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\newcommand{\pdegree}[1]{\gdef\@degree{#1}}
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

% 封面
\newcommand{\makefrontcover}{
\begin{titlepage}
    \backgroundsetup{contents={}}
    \vspace*{0.5cm}
    \begin{center}
        \makebox[9cm][s]{\Huge {\@universityzh}} \\[0.5cm]
        \makebox[9cm][s]{\Huge {\@institutezh\@typezh 班}} \\[1.5cm]
        \makebox[4cm][s]{\huge \@typezh\@classzh} \\[1cm]

        \includegraphics[scale=0.33]{figures/logo.png} \\[1cm]

        {\LARGE \@titlezh} \\[0.5cm]
        {\LARGE \@titleen} \\[1.5cm]
        % \vspace{\fill}

        \begin{center}
            \begin{tabular}{c l}
                {\makebox[8em][s]{\Large 研究生}} \Large ： & \Large \@authorzh \hspace{0.1cm} 撰 \\[0.5cm]
                {\makebox[8em][s]{\Large 指導教授}} \Large ： & \Large \@advisorzh \hspace{0.1cm} 博士 \\
            \end{tabular}
        \end{center}
        \vspace{2cm}
        {\LARGE 中華民國 \zhnumber{\@yearzh} 年 \zhnumber{\@monthzh} 月} \\
    \end{center}
\end{titlepage}
}

% 書名
\newcommand{\maketitlepage}{
  \begin{titlepage}
    \begin{center}
        \begin{singlespace}
        \Large \@titlezh \\[0.5cm]
        \Large \@titleen \\[0.5cm]
        \begin{tabular}{c l}
            {\makebox[4em][s]{\large 研究生}} \large ： & \large \@authorzh \\
            {\makebox[4em][s]{\large 指導教授}} \large ： & \large \@advisorzh \hspace{0.1cm} 博士 \\
        \end{tabular} \\[1cm]
        \Large
        \@universityzh \\[0.1cm]
        \@institutezh\@typezh 班\\[0.1cm]
        \@typezh\@classzh \\[1cm]
        \begin{singlespace}
            A Thesis \\
            Submitted to \\
            \@instituteen \\
            \@universityen \\
            in Partial Fulfillment of the Requirements \\
            for the Degree of \\
            \@degree \\
            in \\
            \@major \\[1cm]
            \@monthen, \@yearen \\
            Kaohsiung, Taiwan, Republic of China \\
        \end{singlespace}
        \vspace{\fill}
        中華民國 \zhnumber{\@yearzh} 年 \zhnumber{\@monthzh} 月\\
        \end{singlespace}
    \end{center}
  \end{titlepage}
}
% 英文審定書
\newcommand{\makeapproval}{
    % \clearpage
    % \phantomsection
    % \addcontentsline{toc}{chapter}{學位論文考試審定書}
  \if@openright\cleardoublepage\else\clearpage\fi
  \ifdefined\withapproval
    % 如果審定書pdf只有一頁請修改pages={1}
    \includepdf[pages={-},angle=0]{approval.pdf}
  \else
  \begin{titlepage}
    \begin{singlespace}
        \begin{center}
        {\large \@titleen} \\
        \vspace{0.5cm}
        \large
        by \\
        \vspace{0.5cm}
        \@authoren \\
        \vspace{1cm}
        A Thesis \\
        Submitted to \\
        \@instituteen \\
        \@universityen \\
        in Partial Fulfillment of the Requirements \\
        for the Degree of
        \@degree \\
        in \\
        \@major \\
        \vspace{1cm}
        Kaohsiung, Taiwan, Republic of China \\
        \@monthen, \@yearen \\
        \end{center}
    \end{singlespace}
    \begin{center}
    \begin{doublespace}
    \fontsize{14}{25}\selectfont
    \begin{tabular}{l r}
        \raisebox{5pt}{Approved by:} & \hspace{2cm}\\
        \rule{5cm}{1pt}\hspace{1.5cm} & \hspace{1.5cm}\rule{5cm}{1pt} \\
        \rule{5cm}{1pt}\hspace{1.5cm} & \hspace{1.5cm}\rule{5cm}{1pt} \\
        \rule{5cm}{1pt}\hspace{1.5cm} & \hspace{1.5cm}\rule{5cm}{1pt} \\
        \\
    \end{tabular}
    \begin{tabular}{l c r}
        \raisebox{5pt}{Thesis Advisor:} & \rule{5cm}{1pt} & \hspace{0.1cm}\\
        \raisebox{5pt}{Institute Director:} & \rule{5cm}{1pt} & \hspace{0.1cm}\\
    \end{tabular}
    \end{doublespace}
    \end{center}
    \vspace*{-1cm}
  \end{titlepage}
  \fi
}


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
    \@typezh \\[0.5cm]
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
    \@typeen \\[0.5cm]
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

