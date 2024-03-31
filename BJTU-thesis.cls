%===================================================

%===================================================

%依赖的Latex版本
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
%声明本文档为模板类
\ProvidesClass{BJTU-thesis}[2018/4/27]

%根据用户选项LoadClass
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\if@isEnMaster\@isEnMasterfalse
\newif\if@isAcMaster\@isAcMasterfalse
\newif\if@isDoctor\@isDoctorfalse
\newif\if@isTwoSide\@isTwoSidefalse
\newif\if@isBlind\@isBlindfalse
\newif\if@isPrint\@isPrintfalse

\DeclareOption{EnMaster}{\@isEnMastertrue}%专硕
\DeclareOption{AcMaster}{\@isAcMastertrue}%学硕
\DeclareOption{Doctor}{\@isDoctortrue}%博士

\DeclareOption{twoside}{\@isTwoSidetrue}% 双面打印
\DeclareOption{blind}{\@isBlindtrue}% 盲审
\DeclareOption{print}{\@isPrinttrue}% 打印版本，双边间距不同

\ProcessOptions\relax
\if@isTwoSide
	\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
	\LoadClass[zihao=-4,a4paper,oneside,openright,UTF8,space=auto]{ctexbook}
\fi

\newcommand{\blindinclude}[1]{
	\if@isBlind
		\relax
	\else
		\include{#1}
	\fi
}

% 0 导入需要的宏包
% 0.1 公式控制
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,upgreek,nicefrac,zhlineskip,textcomp}
% nicefrac: 更舒服的分数公式
% zhlineskip: 中文排版时，数学公式间距调整，更加紧凑
% textcomp: 特殊字体，列举如下：
%	uro currency symbol: \texteuro
%	Trademark symbol: \texttrademark
%	Per thousand (promille) symbol: \textperthousand
%	Degree symbol: \textdegree

% 0.2 页面控制
\RequirePackage{fancyhdr,emptypage}
% fancyhdr
% emptypage

% 0.3 
\RequirePackage{seqsplit} % 长字符换行

% 其他
% \usepackage{array}
\RequirePackage{arydshln,arydshln,tikz,verbatim,stfloats,url,makecell,ulem}
\RequirePackage[multiple]{footmisc}
% * ulem下划线统一，使用\uline{}

% 图表标题控制
\RequirePackage[justification=centering]{caption}

% 颜色控制
\RequirePackage{color,colortbl,xcolor}
\definecolor{comment}{RGB}{35, 20, 120}

% 字体控制
\RequirePackage{fontspec,pifont}
%% 设置英文字体
\RequirePackage[T1]{fontenc}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\newfontfamily\consolas{Consolas}
%% 设置中文字体及加粗大小
\setCJKmainfont[AutoFakeBold = {4.0},ItalicFont={KaiTi}]{SimSun}
\setCJKfamilyfont{zhkai}[AutoFakeBold = {4.0}]{KaiTi}
\setCJKfamilyfont{zhsong}[AutoFakeBold = {4.0}]{SimSun}

% 参考文献控制
% https://github.com/zepinglee/gbt7714-bibtex-style
\bibliographystyle{gbt7714-numerical}
\newcommand{\bibetal}{等人}

\RequirePackage{usebib}
\newbibfield{shorttitle}
\bibinput{reference}
\newcommand{\citeshorttitle}[1]{%
	\usebibentry{#1}{shorttitle}\cite{#1}%
}
% 参考文献引用自定义命令
\newcommand\citeauthorcnyear[1]{\citet{#1}在\citeyear{#1}年} % xx et al.在year年
\newcommand\citeauthorbryear[1]{\citet{#1} (\citeyear{#1})} % xx et al.(year)
\newcommand\citebraceyear[1]{(\citeyear{#1})\cite{#1}} % method (year)[num]

% 定义定理类型，使用二级标题，如“定义 2.1”，“定义 2.2”
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{assumption}{假设}[chapter]
%\newtheorem{Corollary}[Theorem]{推论}
%\newtheorem{Remark}[Theorem]{注}
\newtheorem{example}[theorem]{例}
\newtheorem{definition}[theorem]{定义}
%\newtheorem{Construction}[Theorem]{构造}
%\def\binom#1#2{{#1\choose#2}}
\newtheorem{defi}[theorem]{定义}
\newtheorem{pro}[theorem]{问题}

% 引用自定义命令
\newcommand\secref[1]{章~\ref{#1}}
\newcommand\subsecref[1]{节~\ref{#1}}
\newcommand\figref[1]{图~\ref{#1}}
\newcommand\tabref[1]{表~\ref{#1}}
\newcommand\algoref[1]{算法~\ref{#1}}
\newcommand\equref[1]{公式~(\ref{#1})}
\newcommand\defref[1]{定义~\ref{#1}}
\newcommand\suchfigref[1]{如图~\ref{#1}~所示}
\newcommand\suchtabref[1]{如表~\ref{#1}~所示}
\newcommand\suchequref[1]{如公式~(\ref{#1})~所示}

\renewcommand{\labelenumi}{(\theenumi)}
\newcommand{\ulinebf}[1]{\uline{\textbf{#1}}}

%% 公式自定义命令
\newcommand{\linenicefrac}[2]{#1/#2}
\newcommand{\vA}{\mathbf{A}}
\newcommand{\va}{\mathbf{a}}
\newcommand{\vC}{\mathbf{C}}
\newcommand{\vh}{\mathbf{h}}
\newcommand{\vz}{\mathbf{z}}
\newcommand{\vZ}{\mathbf{Z}}
\newcommand{\vx}{\mathbf{x}}
\newcommand{\vX}{\mathbf{X}}
\newcommand{\vL}{\mathbf{L}}
\newcommand{\vR}{\mathbf{R}}
\newcommand{\vw}{\mathbf{w}}
\newcommand{\vW}{\mathbf{W}}
\newcommand{\vS}{\mathbf{S}}
\newcommand{\vr}{\mathbf{r}}
\newcommand{\vg}{\mathbf{g}}
\newcommand{\vI}{\mathbf{I}}
\newcommand{\vq}{\mathbf{q}}
\newcommand{\vQ}{\mathbf{Q}}
\newcommand{\vk}{\mathbf{k}}
\newcommand{\vK}{\mathbf{K}}
\newcommand{\vv}{\mathbf{v}}
\newcommand{\vV}{\mathbf{V}}
\newcommand{\ts}{{t_\textnormal{0}}}
\newcommand{\te}{{t_\textnormal{1}}}
\newcommand{\td}{{t-\tau}}
\newcommand{\dt}{\mathrm{d}t}
\newcommand{\da}{\mathrm{d}a}
\newcommand{\dd}{\mathrm{d}}



%定义使用者需要填写的标签
\def\BJTU@label@schoolNumber{学校代码：}
\def\BJTU@label@classification{密级：}
\def\BJTU@label@author{作者姓名：}
\def\BJTU@label@studentNumber{{\ziju{2}学号}：}
\def\BJTU@label@advisor{导师姓名：}
\def\BJTU@label@advisorTitle{{\ziju{2}职称}：}
\def\BJTU@label@engineeringMasterField{工程硕士专业领域：}
\def\BJTU@label@degreeLevel{学位级别：}
\def\BJTU@label@degreeType{学位类别：}
\def\BJTU@label@major{学科专业：}
\def\BJTU@label@researchArea{研究方向：}

%定义上述标签的默认值
\def\BJTU@value@schoolNumber{10004}
\def\BJTU@value@classification{公开}
\def\BJTU@value@author{XXXX}
\def\BJTU@value@studentNumber{XXXX}
\def\BJTU@value@advisor{XXXX}
\def\BJTU@value@advisorTitle{XXXX}
\def\BJTU@value@engineeringMasterField{XXXX}
\if@isDoctor
	\def\BJTU@value@degreeLevel{博{\ziju{1}士}}
\else
	\def\BJTU@value@degreeLevel{硕{\ziju{1}士}}
\fi
\def\BJTU@value@degreeType{XXXX}
\def\BJTU@value@major{XXXX}
\def\BJTU@value@researchArea{XXXX}
\def\BJTU@value@title{中文题目}
\def\BJTU@value@englishtitle{英文题目}
\def\BJTU@value@chairman{XXXX}
\def\BJTU@value@keywords{XXXX}
\def\BJTU@value@funding{XXXX}

%定义用户填写上述标签对应值的命令,需要用户在主文档自行调用
\newcommand\schooNumber[1]{\def\BJTU@value@schoolNumber{#1}}
\newcommand\classification[1]{\def\BJTU@value@classification{#1}}
\renewcommand\author[1]{\def\BJTU@value@author{#1}}
\newcommand\studentNumber[1]{\def\BJTU@value@studentNumber{#1}}
\newcommand\advisor[1]{\def\BJTU@value@advisor{#1}}
\newcommand\advisorTitle[1]{\def\BJTU@value@advisorTitle{#1}}
\newcommand\engineeringMasterField[1]{\def\BJTU@value@engineeringMasterField{#1}}
\newcommand\degreeType[1]{\def\BJTU@value@degreeType{#1}}
\newcommand\major[1]{\def\BJTU@value@major{#1}}
\newcommand\researchArea[1]{\def\BJTU@value@researchArea{#1}}
\newcommand\englishtitle[1]{\def\BJTU@value@englishtitle{#1}}
\renewcommand\title[1]{\def\BJTU@value@title{#1}}
\newcommand\datasetschairman[1]{\def\BJTU@value@chairman{#1}}
\newcommand\datasetskeywords[1]{\def\BJTU@value@keywords{#1}}
\newcommand\datasetsfunding[1]{\def\BJTU@value@funding{#1}}

\RequirePackage{datetime}
\newdateformat{monthyeardate}{\THEYEAR~年~\THEMONTH~月}
\newdateformat{yeardate}{\THEYEAR~年}

% 盲审修改
\if@isBlind
	\renewcommand\author[1]{\def\BJTU@value@author{XXXX}}
	\renewcommand\studentNumber[1]{\def\BJTU@value@studentNumber{XXXX}}
	\renewcommand\advisor[1]{\def\BJTU@value@advisor{XXXX}}
	\newcommand{\achievementsAuthor}[2]{#1}
\else
	\newcommand{\achievementsAuthor}[2]{#2}
\fi
%% 3 撰写及打印要求
%% 3.1 论文封面
\newcommand{\makecover}{
	\newpage
	\thispagestyle{empty}
	\vspace*{40pt}
	\begin{figure}[h]
		\centering
		\includegraphics*[width=109.5mm]{schoolName.PNG}
	\end{figure}
	\vspace{-19pt}
	\begin{center}
		\if@isDoctor
		{\songti \zihao{2} \textbf{\songti 博\ 士\ 学\ 位\ 论\ 文}\\}
		\else
		{\songti\zihao{2}\textbf{\songti 硕\ 士\ 学\ 位\ 论\ 文}\\}
		\fi
		\vspace{50pt}
		{\songti\zihao{-3} \BJTU@value@title\\}
		\vspace{16pt}
		{\zihao{-3} \BJTU@value@englishtitle\\}
		\vspace{120pt}
		{\songti\zihao{4}作者：\BJTU@value@author\\}
		\vspace{16pt}
		{\songti\zihao{4}导师：\BJTU@value@advisor\\}
		\vfill
		{\songti\zihao{4} 北京交通大学\\}
		\vspace{17pt}
		{\songti\zihao{4} \monthyeardate\today}
	\end{center}
}

%% 3.2 封2-学位论文版权使用授权书
\newcommand{\makeAuthorization}{
	\setlength{\baselineskip}{20pt}
	\chapter*{学位论文版权使用授权书}
	\thispagestyle{empty}
	\ziju{0.02}本学位论文作者完全了解北京交通大学有关保留、使用学位论文的规定。特授权北京交通大学可以将学位论文的全部或部分内容编入有关数据库进行检索，提供阅览服务，并采用影印、缩印或扫描等复制手段保存、汇编以供查阅和借阅。同意学校向国家有关部门或机构送交论文的复印件和磁盘。学校可以为存在馆际合作关系的兄弟高校用户提供文献传递服务和交换服务。

	（保密的学位论文在解密后适用本授权说明）

	\vspace{100pt}
	学位论文作者签名：~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~导师签名：

	\vspace{20pt}
	签字日期：~~~~~~~~~~~年~~~~~~~~月~~~~~~~~日~~~~~~~~~~~~~~~~~签字日期：~~~~~~~~~~~~年~~~~~~~~月~~~~~~~~日
}

%% 3.3 题名页（内封）
\newcommand{\makeInfo}{
	\newpage
	\thispagestyle{empty}
	\vspace*{-16pt}
	{\songti\zihao{5}\noindent\BJTU@label@schoolNumber\BJTU@value@schoolNumber}
	\hspace{275pt}
	{\songti\zihao{5}\BJTU@label@classification\BJTU@value@classification\\}

	\vspace{-14pt}

	\begin{center}
		{\kaishu\zihao{0}\ziju{0.14}北京交通大学\\}
		\vspace{2pt}
		\if@isDoctor
		{\songti\zihao{2}\ziju{0.28}博士学位论文\\}
		\else
		{\songti\zihao{2}硕~士~学~位~论~文\\}
		\fi

		\vspace{44pt}

		{\songti\zihao{-3}\BJTU@value@title\\}
		\vspace{18pt}
		{\zihao{-3}\BJTU@value@englishtitle\\}
	\end{center}

	\vspace{55pt}

	\begin{table*}[h]
		\renewcommand{\arraystretch}{1.13}
		{\songti\zihao{4}
			\begin{tabular}{ll}
				\noindent\BJTU@label@author \BJTU@value@author  \hspace{35mm}                  & \BJTU@label@studentNumber \BJTU@value@studentNumber \\
				\\
				\noindent\BJTU@label@advisor \BJTU@value@advisor                               & \BJTU@label@advisorTitle \BJTU@value@advisorTitle   \\
				\\
				\if@isEnMaster
				\noindent\BJTU@label@engineeringMasterField \BJTU@value@engineeringMasterField & \BJTU@label@degreeLevel \BJTU@value@degreeLevel     \\
				\else
				\noindent\BJTU@label@degreeType \BJTU@value@degreeType                         & \BJTU@label@degreeLevel \BJTU@value@degreeLevel     \\
				\\
				\noindent\BJTU@label@major \BJTU@value@major                                   & \BJTU@label@researchArea \BJTU@value@researchArea
				\fi
			\end{tabular}
		}
	\end{table*}

	\vfill
	\begin{center}
		{\songti\zihao{4} 北京交通大学\\}
		\vspace{14pt}
		{\songti\zihao{4} \monthyeardate\today}
	\end{center}
}

%% 3.4 致谢
\renewenvironment{thanks}{
	\chapter*{致谢}
	\thispagestyle{empty}
}{}

%% 3.5 摘要（中文摘要）
\newenvironment{abstract}{
	\chapter*{摘要}
	\markboth{摘要}{摘要}
	\pagenumbering{roman}
	\addcontentsline{toc}{chapter}{摘要}
}{}

%% 3.5 摘要（英文摘要）
\newenvironment{englishabstract}{
	\chapter*{ABSTRACT}
	\markboth{ABSTRACT}{ABSTRACT}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}{}

%% 3.5 摘要（中英文关键词）
\newcommand{\keywords}[1]{\textbf{关键词：}#1}
\newcommand{\englishkeywords}[1]{\textbf{KEYWORDS:~}#1}

%% 3.6 序言或前言
\newenvironment{preface}{
	\chapter*{序言}
	\markboth{序言}{序言}
	\addcontentsline{toc}{chapter}{序言}
}{}

%% 3.7 目录
\RequirePackage[xetex]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks,
	linkcolor=black,
	citecolor=black,
	urlcolor=black,
	plainpages=false,
	pdfstartview=FitH
}

\RequirePackage{titletoc}
\RequirePackage{setspace}

\titlecontents{chapter}[0pt]{\songti \zihao{-4}}
{\thecontentslabel\hspace{0.8\ccwd}}
{}
{\hspace{.5em}\titlerule*{.}\contentspage\vspace{6bp}}

\titlecontents{section}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{0.8\ccwd}}
{}
{\hspace{.5em}\titlerule*{.}\contentspage\vspace{6bp}}

\titlecontents{subsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{0.8\ccwd}}
{}
{\hspace{.5em}\titlerule*{.}\contentspage\vspace{6bp}}

\renewcommand\tableofcontents{%
	\chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\pdfbookmark[0]{目录}{bittoc}
	\@starttoc{toc}%
}

%% 3.8 图与附表清单
%\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename~\thecontentslabel\hspace{0.8\ccwd}}
{}
{\hspace{.5em}\titlerule*{.}\contentspage\vspace{6bp}}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename~\thecontentslabel\hspace{0.8\ccwd}}
{}
{\hspace{.5em}\titlerule*{.}\contentspage\vspace{6bp}}

\renewcommand\listfigurename{插图索引}
\renewcommand\listtablename{表格索引}
\RequirePackage{newfloat}
\def\listofequationsnameEN {List of Equations}
\def\listoffiguresnameEN {List of Figures}
\def\listoftablesnameEN {List of Tables}
\DeclareFloatingEnvironment[fileext=lofEN]{figuresEN}[\shortfigurenameEN][\listoffiguresnameEN]
\DeclareFloatingEnvironment[fileext=lotEN]{tablesEN}[\shorttablenameEN][\listoftablesnameEN]

% 中文插图索引
\newcommand{\makecnfigtoc}{
	\begingroup
	\renewcommand*{\addvspace}[1]{}
	\listoffigures
	\addcontentsline{toc}{chapter}{\listfigurename}
	\cleardoublepage
	\endgroup
}
% 英文插图索引
\newcommand{\makeenfigtoc}{
	\begingroup
	\renewcommand*{\addvspace}[1]{}
	\renewcommand{\figurename}{Figure} % 注意：此处修改后要改回
	\listoffiguresEN
	\renewcommand{\figurename}{图} % 此处改回，配套使用
	\addcontentsline{toc}{chapter}{\listoffiguresnameEN}
	\cleardoublepage
	\endgroup
}
% 中文表格索引
\newcommand{\makecntabtoc}{
	\begingroup
	\renewcommand*{\addvspace}[1]{}

	\listoftables
	\addcontentsline{toc}{chapter}{\listtablename}
	\cleardoublepage
	\endgroup
}
% 英文表格索引
\newcommand{\makeentabtoc}{
	\begingroup
	\renewcommand*{\addvspace}[1]{}
	\renewcommand{\figurename}{Table} % 注意：此处修改后要改回
	\listoftablesEN
	\renewcommand{\figurename}{图} % 此处改回，配套使用
	\addcontentsline{toc}{chapter}{\listoftablesnameEN}
	\cleardoublepage
	\endgroup
}

% 缩略语表
\newenvironment{denotation}[1][0cm]{
	\chapter*{缩略语}
	\markboth{缩略语}{缩略语}
	\addcontentsline{toc}{chapter}{缩略语}
	\begin{list}{}{%
			\setlength{\labelwidth}{#1}
			\setlength{\labelsep}{0cm}
			\setlength{\itemindent}{0cm}
			\setlength{\leftmargin}{\labelwidth}
			%\setlength{\leftmargin}{\labelwidth+\labelsep}
			\setlength{\rightmargin}{0cm}
			\setlength{\parsep}{0cm}
			\setlength{\itemsep}{0cm}
			\setlength{\listparindent}{0cm}
			\setlength{\topsep}{0pt}
			\setstretch{1.6604400166} % 基于字体大小设置行间距，这里大约是6磅
		}
		}{
	\end{list}
}
\newcommand{\itemtablur}[3]{
	\begin{tabular} {p{1.5cm}p{9cm}p{3.5cm}} #1 & #2 & #3 \end{tabular}
}
\newcommand{\itemtablurtitle}[3]{
	\begin{tabular} {p{1.5cm}p{9cm}p{3.5cm}} \makecell{#1} & \makecell{#2} & \makecell{#3} \end{tabular}
}

%% 1.3为ctex基本行距
%% 段前间距=期望间距*1.3
%% 段后间距=\zihao{-4}为基础字体，字号12bp，先计算放缩倍数，然后乘以期望间距

%修改不足页面不足一行时出现的异常正文间距
%\flushbottom % 默认底端对齐
\raggedbottom % 防止页面底部对齐时调整间距

%% 3.10 主体部分
\ctexset{
	chapter={
	  name={},
	  number = {\arabic{chapter}},
	  format = {\heiti \centering \zihao{3}}, % 16bp
	  pagestyle = {BJTU@heading},
	  beforeskip = 28bp, % 段前24bp, 24*1.3=31.2
	  afterskip = 27bp, % 段后18bp, 18/12*18=27
	  fixskip = true,
	  aftername = \hspace{8pt}
	 }
}

% 设置一级章节格式
\ctexset{
	section={
	  format={\raggedright \heiti \zihao{-3}}, % 15bp
	  beforeskip = 28bp plus 1ex minus .2ex, % 段前24bp, 24*1.3=31.2
	  afterskip = 27bp plus .2ex, % 段后18bp, 18/12*18=27
	  fixskip = true,
	  aftername = \hspace{8pt}
	 }
}

% ��置二级标题格式
%黑体四号顶左，单倍行距，序号与题目间空一个汉字符
\ctexset{
	subsection={
			format = {\heiti \raggedright \zihao{4}}, % 14bp
			beforeskip =28bp plus 1ex minus .2ex, % 段前24bp, 24*1.3=31.2
			afterskip = 27bp plus .2ex, % 段后18bp, 18/12*18=27
			fixskip = true,
			aftername = \hspace{8pt}
		}
}

% 设置三节标题格式：黑体小四居左书写，单倍行距，序号与题目间空一个汉字符
\ctexset{
	subsubsection={
			format={\heiti \raggedright \zihao{-4}},
			beforeskip=28bp plus 1ex minus .2ex, % 段前24bp, 24*1.3=31.2
			afterskip=27bp plus .2ex, % 段后18bp, 18/12*18=27
			fixskip=true,
			aftername = \hspace{8pt},
			runin=true, % 设置和后文出现在同一段
		}
}

%%===========================设置图表标题选项==========================

%% 3.10.12 论文中的公式 
%% 3.10.4 论文中的插图
%% 3.10.5 论文中的插表
%% 算法
% 表格控制
\RequirePackage[figuresright]{rotating}
\RequirePackage{booktabs}
\RequirePackage{graphicx}% 图片控制
\RequirePackage{subcaption}
\RequirePackage{wrapfig}
\RequirePackage{amsmath}
\RequirePackage{caption}
\RequirePackage{bicaption}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
%% 修改算法标题字体
\floatname{algorithm}{{\kaishu 算法}}

%% 公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
%\numberwithin{table}{chapter}
\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}

\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[table]{
	position = top,
	aboveskip = 6bp,
	belowskip = 6bp,
}

\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}

\captionsetup[figure][bi-second]{name=Figure, listtype+=sEN} %设置图的英文编号前缀
\captionsetup[table][bi-second]{name=Table, listtype+=sEN} %设置表的英文编号前缀

% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 颜色宏包
\RequirePackage{xcolor}

% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
	frame=shadowbox, %把代码用带有阴影的框圈起来
	commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
	rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
	keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
	showstringspaces=false,%不显示代码字符串中间的空格标记
	stringstyle=\ttfamily, % 代码字符串的特殊格式
	keepspaces=true, %
	breakindent=22pt, %
	numbers=left,%左侧显示行号
	stepnumber=1,%
	numberstyle=\tiny, %行号字体用小号
	basicstyle=\footnotesize, %
	showspaces=false, %
	flexiblecolumns=true, %
	breaklines=true, %对过长的代码自动换行
	breakautoindent=true,%
	breakindent=4em, %
	aboveskip=1em, %代码块边框
	%% added by http://bbs.ctex.org/viewthread.php?tid=53451
	fontadjust,
	captionpos=t,
	framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
	xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
	texcl=true,
	% 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
	extendedchars=false,columns=flexible,mathescape=true
	numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

%% enumerate 列表环境间距调节
\usepackage{enumitem}
%\setitemize[1]{itemsep=2pt,parsep=0pt,topsep=0pt}
%\setenumerate[1]{itemsep=2pt,parsep=0pt,topsep=0pt}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%% 3.11 参考文献环境

%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}

\renewenvironment{thebibliography}[1]
{\zihao{5}\setlength{\baselineskip}{16bp}
	\chapter*{\bibname}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{chapter}{参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}

%% 3.18 设置页边距和装订线
\if@isPrint
	\usepackage[
		top=3.0cm,% 此处对应word中上边距3.0
		bottom=2.6cm,
		left=2.5cm,
		right=2.5cm,
		bindingoffset=1.0cm,
		headheight=1.6cm,
		headsep=0.9cm
	]{geometry}
\else
	\usepackage[
		top=3.0cm,% 此处对应word中上边距3.0
		bottom=2.6cm,
		left=3.0cm,
		right=3.0cm,
		%bindingoffset=1.0cm, % 分散到左右边距
		headheight=1.6cm,
		headsep=0.9cm
	]{geometry}
\fi

%% 3.18 定义正文的页眉页脚格式
\def\BJTU@chapter{}
\fancypagestyle{BJTU@heading}{
	\fancyhf{}
	\fancyhead[CE]{%奇数页
		\if@isDoctor
			{\songti \ziju{0} \zihao{5} 北京交通大学博士学位论文}
		\else
			{\songti \ziju{0} \zihao{5} 北京交通大学硕士学位论文}
		\fi
	}
	\fancyhead[CO]{{\songti \ziju{0} \zihao{5}\leftmark}}%偶数页
	\fancyfoot[C]{{\ziju{0} \zihao{-5}\thepage}}
}

%% 3.18 设定文档页眉页脚
\pagestyle{BJTU@heading}
%必须在设置完文档的页眉页脚格式之后再重定义此命令
\renewcommand{\chaptermark}[1]{
	\markboth{#1}{}
}

\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{imakeidx}
\indexsetup{
	firstpagestyle = BJTU@heading,
	level = \section*,
	toclevel = section,
	noclearpage,
}

\newcommand{\makeDataset}{
	\chapter*{学位论文数据集}
	\markboth{学位论文数据集}{}
	\addcontentsline{toc}{chapter}{学位论文数据}

	%% 3.16 学位论文数据集
	\begin{table}[htbp]
		\renewcommand{\arraystretch}{1.4}
		\zihao{5}\setlength{\baselineskip}{16bp}
		\centering
		\resizebox{\textwidth}{!}{
			\begin{tabular}{|p{6.94em}rrrr|}
				\hline
				\multicolumn{1}{|p{6.94em}|}{关键词*}                 & \multicolumn{1}{p{6.065em}|}{密级*}                                       & \multicolumn{1}{p{6.625em}|}{中图分类号}                  & \multicolumn{1}{p{7em}|}{UDC}                          & \multicolumn{1}{p{6.69em}|}{论文资助}                \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{\BJTU@value@keywords} & \multicolumn{1}{p{6.065em}|}{\BJTU@value@classification}                & \multicolumn{1}{p{6.625em}|}{}                       & \multicolumn{1}{p{7em}|}{}                             & \multicolumn{1}{p{6.69em}|}{\BJTU@value@funding} \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{学位授予单位名称*}          & \multicolumn{1}{p{6.625em}|}{学位授予单位代码*}                                 & \multicolumn{1}{p{7em}|}{学位类别*}                      & \multicolumn{1}{p{6.69em}|}{学位级别*}                                                                        \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{北京交通大学}             & \multicolumn{1}{p{6.625em}|}{10004}                                     & \multicolumn{1}{p{6.69em}|}{\BJTU@value@degreeType } & \multicolumn{1}{p{6.69em}|}{\BJTU@value@degreeLevel}                                                      \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{论文题名*}              & \multicolumn{2}{p{13.625em}|}{并列题名}                                     & \multicolumn{1}{p{6.69em}|}{论文语种*}                                                                                                                               \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{\BJTU@value@title}  & \multicolumn{2}{p{6.69em}|}{}                                           & \multicolumn{1}{p{6.69em}|}{中文}                                                                                                                                  \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{作者姓名*}                & \multicolumn{2}{p{13.005em}|}{\BJTU@value@author}                       & \multicolumn{1}{p{7em}|}{学号*}                        & \multicolumn{1}{p{6.69em}|}{\BJTU@value@studentNumber}                                                    \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{培养单位名称*}            & \multicolumn{1}{p{7em}|}{培养单位代码*}                                       & \multicolumn{1}{p{7em}|}{培养单位地址}                     & \multicolumn{1}{p{6.69em}|}{邮编}                                                                           \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{北京交通大学}             & \multicolumn{1}{p{6.69em}|}{\BJTU@value@schoolNumber}                   & \multicolumn{1}{p{7em}|}{北京市海淀区西直门外上园村3号}            & \multicolumn{1}{p{6.69em}|}{100044}                                                                       \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{学科专业*}              & \multicolumn{1}{p{6.625em}|}{研究方向*}                                     & \multicolumn{1}{p{7em}|}{学制*}                        & \multicolumn{1}{p{6.69em}|}{学位授予年*}                                                                       \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{\BJTU@value@major}  & \multicolumn{1}{p{6.625em}|}{\BJTU@value@researchArea}                  & \multicolumn{1}{p{7em}|}{五年}                         & \multicolumn{1}{p{6.69em}|}{\yeardate\today}                                                              \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{论文提交日期*}              & \multicolumn{4}{p{26em}|}{\monthyeardate\today}                                                                                                                                                                                            \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{导师姓名*}                & \multicolumn{2}{p{13.005em}|}{\BJTU@value@advisor}                      & \multicolumn{1}{p{7em}|}{职称*}                        & \multicolumn{1}{p{6.69em}|}{\BJTU@value@advisorTitle}                                                     \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{评阅人}                  & \multicolumn{2}{p{12.69em}|}{答辩委员会主席*}                                  & \multicolumn{2}{p{13.69em}|}{答辩委员会成员}                                                                                                                            \\
				\hline
				\multicolumn{1}{|r|}{\multirow{2}[2]{*}{}}         & \multicolumn{2}{p{13.005em}|}{\multirow{2}[2]{*}{\BJTU@value@chairman}} & \multicolumn{2}{r|}{\multirow{2}[2]{*}{}}                                                                                                                        \\
				\multicolumn{1}{|r|}{}                             & \multicolumn{2}{r|}{}                                                   & \multicolumn{2}{r|}{}                                                                                                                                            \\
				\hline
				\multicolumn{5}{|p{33.32em}|}{电子版论文提交格式  文本（ \checkmark ）  图像（ ） 视频（ ） 音频（ ） 多媒体（ ） 其他（ ）}                                                                                                                                                                                                      \\
				\multicolumn{5}{|p{33.32em}|}{推荐格式：application/msword；application/pdf}                                                                                                                                                                                                                          \\
				\hline
				\multicolumn{2}{|p{13.005em}|}{电子版论文出版（发布）者}       & \multicolumn{2}{p{13.625em}|}{电子版论文出版（发布）地}                             & \multicolumn{1}{p{6.69em}|}{权限声明}                                                                                                                                \\
				\hline
				\multicolumn{2}{|r|}{}                             & \multicolumn{2}{r|}{}                                                   &                                                                                                                                                                  \\
				\hline
				\multicolumn{1}{|p{6.94em}|}{论文总页数*}               & \multicolumn{4}{p{26em}|}{\thepage}                                                                                                                                                                                                        \\
				\hline
				\multicolumn{5}{|p{33.32em}|}{共33项，其中带*为必填数据，为21项。}                                                                                                                                                                                                                                             \\
				\hline
			\end{tabular}%
		}
		\label{tab:addlabel}%
	\end{table}%
}

\endinput