#!/bin/bash
COMMAND=$(cat | jq -r '.tool_input.command')

if echo "$COMMAND" | grep -qE "git (push.*--force|commit.*--amend)"; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "Force push and amend are not allowed. Create new commits instead."
    }
  }'
  exit 0
fi

exit 0
