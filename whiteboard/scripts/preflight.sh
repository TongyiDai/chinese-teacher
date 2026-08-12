#!/usr/bin/env bash
# Preflight check for the beautiful-feishu-whiteboard skill.
# Verifies the tools needed to render an SVG and write it into Feishu as an editable whiteboard.
set -u
ok=1
echo "▶ Checking prerequisites for beautiful-feishu-whiteboard…"
echo

# Node ≥ 20
if command -v node >/dev/null 2>&1; then
  echo "  ✓ Node $(node -v)"
else
  echo "  ✗ Node.js not found — install Node ≥ 20  (https://nodejs.org)"
  ok=0
fi

# lark-cli  (npm: @larksuite/cli)  — auth + writing to Feishu
if command -v lark-cli >/dev/null 2>&1; then
  echo "  ✓ lark-cli ($(lark-cli --version 2>/dev/null | head -1))"
  auth_out="$(LARKSUITE_CLI_NO_UPDATE_NOTIFIER=1 LARKSUITE_CLI_NO_SKILLS_NOTIFIER=1 lark-cli auth status --json --verify 2>&1 || true)"
  if printf '%s' "$auth_out" | python3 -c 'import json,sys; p=json.load(sys.stdin); raise SystemExit(0 if p.get("identity") == "user" and p.get("verified") is True else 1)' 2>/dev/null; then
    echo "  ✓ lark-cli verified a user identity"
  elif printf '%s' "$auth_out" | grep -Eqi 'unknown command|no such command|unrecognized command'; then
    contact_out="$(LARKSUITE_CLI_NO_UPDATE_NOTIFIER=1 LARKSUITE_CLI_NO_SKILLS_NOTIFIER=1 lark-cli contact +get-user --as user --json 2>/dev/null || true)"
    if printf '%s' "$contact_out" | python3 -c 'import json,sys; p=json.load(sys.stdin); u=(p.get("data") or {}).get("user") or {}; raise SystemExit(0 if p.get("ok") is True and p.get("identity") == "user" and bool(u.get("open_id") or u.get("openId")) else 1)' 2>/dev/null; then
      echo "  ✓ current user resolved through read-only contact probe"
    else
      echo "  ! lark-cli is installed, but no compatible user identity probe succeeded. Run:"
      echo "        lark-cli config init     # first-time setup, scan the QR"
      echo "        lark-cli auth login      # authorize your Feishu/Lark account"
    fi
  elif [ -n "$auth_out" ]; then
    echo "  ! lark-cli authentication check failed. Fix the current profile before writing whiteboards."
  else
    echo "  ! lark-cli may not be authenticated. Run:"
    echo "        lark-cli config init     # first-time setup, scan the QR"
    echo "        lark-cli auth login      # authorize your Feishu/Lark account"
  fi
else
  echo "  ✗ lark-cli not found. Install and authenticate:"
  echo "        npm install -g @larksuite/cli"
  echo "        lark-cli config init     # scan the QR"
  echo "        lark-cli auth login"
  ok=0
fi

# whiteboard-cli  (run via npx, auto-downloads)
if npx -y @larksuite/whiteboard-cli@^0.2.11 -v >/dev/null 2>&1; then
  echo "  ✓ @larksuite/whiteboard-cli reachable via npx"
else
  echo "  ! could not reach @larksuite/whiteboard-cli via npx (needs network on first run)"
fi

echo
if [ "$ok" = 1 ]; then
  echo "✅ Ready. You also need a Feishu/Lark account — boards are written to your own tenant."
else
  echo "❌ Missing prerequisites above. Install them, then re-run this check."
  exit 1
fi
