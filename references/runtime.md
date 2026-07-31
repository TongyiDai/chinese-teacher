# Runtime and capability contract

## Required

- An agent host that can read Markdown and execute the requested document workflow.
- Node.js 20+ when using the bundled whiteboard preflight or whiteboard tooling.
- Run `scripts/doctor.sh --json` before choosing a delivery path.

## Optional capabilities

| Capability | Detection | Fallback |
|---|---|---|
| Local writing | always available after the Skill is installed | return Markdown or local artifacts |
| Feishu write | `lark-cli auth status --json --verify` succeeds | generate local SVG/Markdown and report pending write |
| Editable whiteboard | `npx @larksuite/whiteboard-cli` is reachable | keep SVG source and use plain-text document output |

Resolve the Skill directory from the script location. Never assume a particular
user name or absolute home directory. Keep generated drafts outside the public
repository unless the user explicitly asks to add a fixture.

## External-write contract

Before a Feishu write, confirm the target document, insertion position, account
or tenant, and write method. After writing, read back the document structure and
the text around every inserted board. Report `generated`, `inserted`, and
`verified` as separate states.
