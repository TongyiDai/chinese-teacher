# Source Map

这个文件记录第一版 `中文老师` 的主要公开来源，以及它们被怎样转译为中文飞书工作文档规则。

## Selected sources

### 1. GitHub Docs style guide

- Repo: `github/docs`
- 公开仓库热度高，适合作为“长期维护的文档写法”样本。
- 已读取的材料：
  - `content/contributing/style-guide-and-content-model/style-guide.md`
  - `.github/instructions/style-guide-summary.instructions.md`
- 本 skill 主要吸收的原则：
  - 清晰优先于语法洁癖。
  - 结构先于细节，标题必须可独立理解。
  - 流程用编号列表，并把前置条件放到步骤前。
  - 少用 alert，少用 inline link 杂糅正文。
  - 用确定动作词，不用模糊 modal verbs。

### 2. Google Markdown style guide

- Repo: `google/styleguide`
- 已读取的材料：
  - `docguide/style.md`
- 本 skill 主要吸收的原则：
  - 文档应保持最小可维护集合，不堆积过期内容。
  - 文档布局要稳定，先有短引言，再展开主题。
  - 列表、表格、标题要各司其职，不混用。
  - 源文本和结构都要简单、可维护、可复用。

### 3. Microsoft Style Guide

- Repo: `MicrosoftDocs/microsoft-style-guide`
- 这是公开、长期被引用的风格指南，虽然仓库 stars 不高，但行业影响力足够。
- 本轮抓到的可验证材料：
  - 仓库元信息与公开可访问内容
  - GitHub Docs style guide 中也明确把 Microsoft Style Guide 作为外层通用参照
- 本 skill 主要吸收的原则：
  - 避免歧义代词和歧义情态动词。
  - 避免名词化和 stacked nouns。
  - 主语、动作、对象都要明确。

### 4. 18F content-guide

- Repo: `18F/content-guide`
- 公开口碑好，但原站点和部分原始页面抓取不稳定。
- 本轮已验证：
  - 仓库存在、长期被引用、stars 较少但质量口碑良好。
  - 仓库 README 明确指向内容指南定位。
- 第一版只把它作为补充候选来源，不把具体条文写死进 hard rules。
- 后续若抓到稳定正文，可补强 plain language 规则。

## Translation strategy

这个 skill 不是把英文风格指南翻译成中文，也不是把原文硬拷进本地，而是做三层转译：

1. 先抽象出高共识原则。
2. 再筛掉只适用于英文 docs 仓库的写法。
3. 最后转成中文飞书工作文档可直接执行的规则。

## What changed for Chinese Feishu docs

- 英文技术文档强调链接、Markdown、代码块纪律；中文工作文档更强调结论前置、责任明确、动作明确。
- 英文 docs 常假设读者会线性阅读；飞书工作文档更常被“扫读”，所以开头和标题必须更像摘要。
- 飞书文档常被用于协作和决策，因此本 skill 对 owner、时间、待决策项、风险说明做了更强约束。

## First-version scope boundaries

- 第一版优先服务中文工作文档，不追求覆盖所有写作场景。
- 第一版不处理品牌语气、营销语气、法律语气。
- 第一版不内置具体业务话术，只定义结构和文风。
