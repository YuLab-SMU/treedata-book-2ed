# treedata-book 重构章节映射表（零删减方案）

日期：2026-10-24
目标：把"ggtree 支持各种树状结构"从前言承诺变成全书结构事实；**所有现有内容 100% 保留**，只做搬移、重组和少量新增导论性内容。系统发育树仍是主线叙事，但不再是隐含的唯一场景。

## 重构原则

1. **只搬不删**：下表逐节列出旧内容的新去处；任何小节都能在表中找到去向。
2. **章节标题去领域化**："Phylogenetic Tree Visualization" → "Tree Visualization" 等；进化专属内容用领域标注（domain callout）保留，不删除。
3. **第 10 章拆解归位**：对象转换类内容进 Part I/II 的对应位置，不再作为收尾"杂项"。
4. **交叉引用安全**：全部使用 `{#sec-...}` label，Quarto 按 label 解析，章节号变动不破坏引用；只需保证 label 不改（本方案不改任何 label）。

## 新目录总览

```
front matter        index.qmd (Preface)、00_author.qmd
Part I  树状数据：模型、输入输出与操作
  Ch1  Trees and Tree-like Structures            [新增导论 + 吸收 §1.2]
  Ch2  Importing Tree Data                       [原 Ch1]
  Ch3  Manipulating Tree with Data               [原 Ch2]
  Ch4  Exporting Tree Data                       [原 Ch3]
Part II 树的可视化与注释
  Ch5  Tree Visualization: Layouts and Components [原 Ch4 前半]
  Ch6  Tree Aesthetics: Color, Scale, and Theme   [原 Ch4 后半]
  Ch7  Tree and Tree-like Objects in R            [原 Ch10，整章前移]
  Ch8  Tree Annotation                            [原 Ch6]
  Ch9  Visual Exploration of Trees                [原 Ch7]
  Ch10 Tree with Data                             [原 Ch8]
  Ch11 Annotating Trees with Images and Sub-plots [原 Ch9]
  Ch12 Interactive ggtree                         [原 Ch5，前移]
  Ch13 ggtreeExtra: Data on Circular/Fan Layouts  [原 Ch11]
Part III ggtree 扩展生态
  Ch14 Other ggtree Extensions                    [原 Ch12]
Part IV 工具与实例
  Ch15 ggtree Utilities                           [原 Ch13]
  Ch16 Gallery of Reproducible Examples           [原 Ch14，按领域分组]
Appendix
  A1 FAQ / A2 Related Tools / A3 Figures & Tables / References   [全部原样]
```

## 逐章映射表

说明：「§」指旧章内的二级/三级小节。所有 Summary 小节随章走，不再单列。

### 原 Ch1 `01_treeio_importing_tree.qmd` → 新 Ch2（+ 部分进新 Ch1）

| 旧节 | 去向 |
|---|---|
| Overview of Phylogenetic Tree Construction {#pc} | **新 Ch1**，作为"应用领域之一：系统发育"小节（加领域标注） |
| Phylogenetic Tree Formats {#format}（Newick/NEXUS/NHX/Jplace/软件输出） | 新 Ch2 原样保留 |
| Getting Tree Data with treeio（Overview / Function demonstration） | 新 Ch2 原样 |
| Converting other tree-like objects to phylo/treedata {#as-treedata} | 新 Ch2 保留，并在结尾加指向新 Ch7 的交叉引用（Ch7 讲这些对象的可视化） |
| Getting information from treedata object {#get-treedata-data} | 新 Ch2 原样 |

### 原 Ch2 `02_tidytree.qmd` → 新 Ch3（整章原样）

全部小节（tidy interface、phylo/treedata object、access related nodes、Data Integration、merge、link external data、grouping taxa、Rerooting、Rescaling、Subsetting 三节、fortify）原样保留，仅章号 2→3。

### 原 Ch3 `03_treeio_exporting_tree.qmd` → 新 Ch4（整章原样）

全部小节（BEAST Nexus 导出、software output 转换、外部数据合并、jtree 格式）原样保留，章号 3→4。

### 原 Ch4 `04_ggtree_visualization.qmd` → 拆为新 Ch5 + 新 Ch6（47.6K 过大，一分为二）

| 旧节 | 去向 |
|---|---|
| Introduction | 新 Ch5 |
| Visualizing Phylogenetic Tree with ggtree（Basic Tree Visualization、Layouts {#sec-tree-layouts}） | 新 Ch5（章题改 "Tree Visualization: Layouts and Components"） |
| Displaying Tree Components：treescale {#sec-geom-trescale}、nodes/tips、labels、root-edge | 新 Ch5（treescale 加"进化距离"领域标注） |
| Color tree | 新 Ch6 |
| Rescale tree | 新 Ch6 |
| Modify components of a theme | 新 Ch6 |
| Paired Trees and Tanglegrams | 新 Ch6 |
| Visualize a List of Trees（含 Annotate one tree…、DensiTree {#sec-densitree}） | 新 Ch6 |
| Summary | 拆为两章各写简短收尾（原 Summary 文字归新 Ch5，新 Ch6 收尾为新写的一两句话，属允许的新增） |

### 原 Ch5 `05_interactive_ggtree.qmd` → 新 Ch12（整章前移，原样）

全部小节（interactivity 开关、tooltip/data_id、interactive layers、回到静态输出、practical notes）原样。位置从 Part II 开头移到 Part II 末尾（ggtreeExtra 之前），逻辑：先讲完静态语法再讲交互。

### 原 Ch6 `06_ggtree_annotation.qmd` → 新 Ch8（整章原样，章题去 "Phylogenetic"）

| 旧节 | 去向 |
|---|---|
| Visualizing and Annotating Tree Using Grammar of Graphics | 新 Ch8 原样 |
| Layers for Tree Annotation（Colored strips、Highlight clades、Taxa connection、Uncertainty of evolutionary inference） | 新 Ch8 原样（Uncertainty 一节加领域标注） |
| Tree Annotation with Output from Evolution Software | 新 Ch8 原样，加领域标注"系统发育分析软件输出" |

### 原 Ch7 `07_ggtree_manipulation.qmd` → 新 Ch9（整章原样，章题 "Visual Exploration of Trees"）

全部小节（viewing clade、scaling clade、collapse/expand、grouping taxa、exploring structure）原样，章号 7→9。

### 原 Ch8 `08_ggtree_tree_with_data.qmd` → 新 Ch10（整章原样，章题 "Tree with Data"）

全部小节（`%<+%` 映射 {#sec-attach-operator}、facet_plot、gheatmap 及多矩阵、msaplot、composite plots、ggtree object 与 update view）原样，章号 8→10。MSA 一节加领域标注。

### 原 Ch9 `09_ggtree_with_silhouette.qmd` → 新 Ch11（整章原样，章题 "Annotating Trees with Images and Sub-plots"）

全部小节（ggimage、Phylopic、sub-plots 的 bar/pie/mixed、Phylomoji 全部子节含 circular/clade labels/Apple Color Emoji/ASCII art）原样，章号 9→11。

### 原 Ch10 `10_ggtree_tree_objects.qmd` → 新 Ch7（整章前移 + 改题，内容零删减）

这是本次重构的关键动作：从 Part II 末尾（原第 10 位）前移到可视化基础（新 Ch5/6）之后，让持非 phylo 对象的读者尽早知道"你的对象能直接画"。章题从 "ggtree for Other Tree-like Objects" 改为 **"Tree and Tree-like Objects in R"**（"Other" 一词本身就是二等公民措辞）。

| 旧节 | 去向 |
|---|---|
| ggtree for Phylogenetic Tree Objects（phylo4/phylo4d {#sec-phylobase}、phylog {#sec-phylog}、phyloseq {#sec-phyloseq}、obkData {#sec-obkdata}） | 新 Ch7 原样 |
| ggtree for Dendrograms {#sec-dendrogram} | 新 Ch7 原样（hclust/聚类是最大的非进化用户群，可在节首加一句入口导语，属允许的新增） |
| ggtree for Tree Graph {#sec-igraph} | 新 Ch7 原样 |
| ggtree for Other Tree-like Structures | 新 Ch7 原样（改小节题为 "Other Tree-like Structures"，去掉 "ggtree for" 前缀以统一句式；或保留原标题，二选一） |

### 原 Ch11 `11_ggtree_exts.qmd` → 新 Ch13（整章原样）

全部小节（ggtreeExtra 引言、geom_fruit 单图 {#sec-geom-fruit1}、多图多维 {#sec-geom-fruit2}、群体遗传学示例）原样，章号 11→13。

### 原 Ch12 `12_ggtree_exts-others.qmd` → 新 Ch14（整章原样）

MicrobiotaProcess {#sec-MicrobiotaProcess}、tanggle 网络可视化原样，章号 12→14。

### 原 Ch13 `13_ggtree_utilities.qmd` → 新 Ch15（整章原样）

全部小节（facet_widths、facet_labeller、Geometric Layers、Layout Utilities、Scale Utilities 含 xlim_expand/ggexpand、td_filter、td_unnest、tiporder、padding labels、identify 交互标注）原样，章号 13→15。

### 原 Ch14 `14_ggtree_gallery.qmd` → 新 Ch16（全部示例保留，按领域分组重排）

| 旧节 | 去向（新 Ch16 内的分组） |
|---|---|
| Visualizing pairwise nucleotide sequence distance… {#sec-hpv58} | 分组"基因组学与进化" |
| Displaying Different Symbolic Points for Bootstrap Values {#sec-symbolic-bootstrap} | 分组"基因组学与进化" |
| Highlighting Different Groups {#sec-phylo-grouping}（含全部子节） | 分组"基因组学与进化" |
| Phylogenetic Tree with Genome Locus Structure {#sec-genome-locus} | 分组"基因组学与进化" |
| （新增，可后续补充） | 分组"聚类与层次数据"、"微生物组"（MicrobiotaProcess 例子可从附录 A2 的 taxonomy 小节呼应）——不强制，本次只重组现有示例 |

### 附录：全部原样

| 文件 | 去向 |
|---|---|
| A-app-faq.qmd（Installation、Basic R、aes mapping、Text/Label、Branch Setting 全部子节、X-axis labels、behind phylogeny、circular 相关、export edit） | 原样保留 |
| A-app-tools.qmd（MicrobiotaProcess taxonomy、rotl、ASCII tree、zoom、ggimage tips 两例、Jupyter） | 原样保留 |
| A-app-fig-tab.qmd、B-references.qmd、session-info.qmd、ggtree-comicR.qmd、ggtree-identity.qmd、ggtree-plotly.qmd | 原样保留 |

## 需要新增的内容（只有增加，没有删减）

1. **新 Ch1 "Trees and Tree-like Structures"**：树状数据统一模型（节点/边/关联数据 = treedata 三件套）；树类型总览表（系统发育、hclust/dendrogram、taxonomy、目录树、igraph 树形子图、决策树）+ 每类一小段"数据从哪来、怎么进 treedata、跳转到哪章"；吸收原 §1.2 作为"系统发育"领域小节。
2. 各"领域标注"（domain callout）：一小段框注说明某概念的进化生物学含义，非进化读者可跳过。
3. Preface 的 "Structure of the book" 一节需按新四部分结构重写（内容性改写，非删减）。
4. `_quarto.yml` / `_bookdown.yml` 的章节列表按新目录重排（文件名建议保持不变或按新编号重命名，二选一：**推荐重命名**以保持文件名与章号一致，git mv 保留历史）。

## 执行注意事项

- **label 不改**：所有 `{#sec-...}` 原样保留，交叉引用自动跟随新位置；`A-app-fig-tab.qmd`（图表索引）按 label 生成的 LOT/LOF 不受影响。
- **chapter_name 与编号**：Quarto 自动编号，无需手改。
- **文件重命名清单**（若采纳重命名方案）：
  - `01→02`、`02→03`、`03→04`（Part I 三章顺延）
  - `04→05+06`（拆分，新文件如 `05_ggtree_layouts.qmd`、`06_ggtree_aesthetics.qmd`）
  - `10→07`（`07_tree_objects.qmd`）
  - `06→08`、`07→09`、`08→10`、`09→11`、`05→12`、`11→13`、`12→14`、`13→15`、`14→16`
  - ⚠ 多个旧章目标号有环（如旧 05→新 12 而旧 12→新 14），重命名需按拓扑顺序分两批 git mv，或先全部加临时前缀再归位。
- **拆分 Ch4 的切割点**：`### Color tree`（约 L708）之前归新 Ch5，从 `### Color tree` 起归新 Ch6；两个新文件各自补 `#` 章标题与简短引言。
- **cache**：`cache-objs/` 与 chunk cache 不受章节顺序影响，但拆分 Ch4 后首次构建需重建该章缓存。
