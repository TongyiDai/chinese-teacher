# Lark CLI integration

This Skill can produce a complete local draft without Feishu. Feishu is an
optional delivery capability.

## Preflight

```bash
command -v lark-cli
lark-cli auth status --json --verify
```

Keep personal and company tenants separate. Do not put profile identifiers,
tokens, document tokens, internal URLs, or real document titles in examples.

## Safe sequence

1. Resolve the live target document and target account.
2. Read the document outline and existing boards.
3. Map each board topic to a paragraph anchor.
4. Write only after the user has requested or confirmed the external write.
5. Read back the changed blocks and surrounding text.
6. If readback is unavailable, report `inserted_unverified`; do not claim success.

If authentication or the companion `lark-doc` capability is unavailable, retain
the local Markdown and SVG outputs and stop at `generated`.
