# 参与共建 · Contributing

欢迎参与改进。提交前请遵循几条简单约定，帮助保持这个 Agent Skill 稳定、可移植、可安全公开。

## 提 Issue

- **Bug**：用 Bug 模板，说清在哪个 Agent（Codex / TRAE / Claude / Cursor）、哪一步、期望什么、实际什么。
- **想法 / 新场景**：用 Feature 模板，先讲清要解决的问题，再讲方案。

## 提 PR

1. Fork 后新建分支，别直接改 `main`。
2. 本地先跑一遍发布就绪校验（和 CI 一致）：
   ```bash
   git clone --depth 1 https://github.com/TongyiDai/skill-release-check.git /tmp/srcheck
   python /tmp/srcheck/scripts/check_skill_readiness.py . --tracked-only
   ```
3. 若仓库带测试，也请在本地跑通。
4. 改 `SKILL.md` 的 name / description 时，注意仍能被 Agent 正确触发。
5. commit 信息说清「改了什么、为什么」。

## 原则

- **跨 Agent 中立**：不绑定任何单一客户端。
- **可移植**：不写死本机绝对路径（如 `/Users/xxx`）。
- **隐私安全**：不提交任何密钥、内部标识或个人敏感数据；CI 会自动扫。
