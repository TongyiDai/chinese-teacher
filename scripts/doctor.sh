#!/usr/bin/env bash
set -u

root="$(cd "$(dirname "$0")/.." && pwd)"
node_ok=0
lark_ok=0
whiteboard_ok=0

command -v node >/dev/null 2>&1 && node_ok=1
if command -v lark-cli >/dev/null 2>&1; then
  if lark-cli auth status --json --verify >/dev/null 2>&1; then
    lark_ok=1
  fi
fi
if command -v npx >/dev/null 2>&1 && npx -y @larksuite/whiteboard-cli@^0.2.11 -v >/dev/null 2>&1; then
  whiteboard_ok=1
fi

if [ "${1:-}" = "--json" ]; then
  printf '{"ok":%s,"skill_root":"%s","required":{"node":%s},"optional":{"feishu_write":%s,"whiteboard_cli":%s},"next":"%s"}\n' \
    "$([ "$node_ok" = 1 ] && echo true || echo false)" \
    "$root" "$([ "$node_ok" = 1 ] && echo true || echo false)" \
    "$([ "$lark_ok" = 1 ] && echo true || echo false)" \
    "$([ "$whiteboard_ok" = 1 ] && echo true || echo false)" \
    "$([ "$lark_ok" = 1 ] && echo 'local SVG only' || echo 'run lark-cli auth status --json --verify before Feishu writes')"
  exit 0
fi

echo "skill_root=$root"
echo "node=$([ "$node_ok" = 1 ] && echo ready || echo missing)"
echo "feishu_write=$([ "$lark_ok" = 1 ] && echo ready || echo unavailable)"
echo "whiteboard_cli=$([ "$whiteboard_ok" = 1 ] && echo ready || echo unavailable)"
if [ "$node_ok" = 1 ] && [ "$lark_ok" = 1 ]; then
  echo "status=ready"
else
  echo "status=local-only"
fi
