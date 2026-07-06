#!/usr/bin/env bash
#
# Install the ai-prd-workflow prompts as native slash commands for
# Claude Code (.claude/commands/) and Cursor (.cursor/commands/).
#
# Usage:
#   ./install.sh [target-project-dir] [--claude|--cursor|--all]
#
# Examples:
#   ./install.sh ~/code/my-project             # install for both tools
#   ./install.sh ~/code/my-project --claude    # Claude Code only
#   ./install.sh ~/code/my-project --cursor    # Cursor only
#
# Also works without cloning the repo (prompts are fetched from GitHub):
#   curl -fsSL https://raw.githubusercontent.com/nurettincoban/ai-prd-workflow/main/install.sh | bash -s -- /path/to/project

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/nurettincoban/ai-prd-workflow/main"
SCRIPT_SOURCE="${BASH_SOURCE[0]:-}"
if [ -n "$SCRIPT_SOURCE" ] && [ -f "$SCRIPT_SOURCE" ]; then
    SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SOURCE")" && pwd)"
else
    SCRIPT_DIR=""
fi

usage() {
    sed -n '3,15p' "$0" 2>/dev/null | sed 's/^# \{0,1\}//'
}

TARGET="."
MODE="all"
for arg in "$@"; do
    case "$arg" in
        --claude) MODE="claude" ;;
        --cursor) MODE="cursor" ;;
        --all)    MODE="all" ;;
        --help|-h)
            echo "Install ai-prd-workflow slash commands into a project."
            echo ""
            echo "Usage: ./install.sh [target-project-dir] [--claude|--cursor|--all]"
            echo ""
            echo "  --claude   Install Claude Code commands only (.claude/commands/)"
            echo "  --cursor   Install Cursor commands only (.cursor/commands/)"
            echo "  --all      Install both (default)"
            exit 0
            ;;
        *) TARGET="$arg" ;;
    esac
done

if [ ! -d "$TARGET" ]; then
    echo "Error: target directory '$TARGET' does not exist." >&2
    exit 1
fi

# command-name|source-prompt-file|description|argument-hint
COMMANDS='
create-prd|interactive-prd-creation-prompt.md|Create a PRD through guided step-by-step questioning|
verify-prd|prd-comprehensive-verification-prompt.md|Verify and improve PRD.md by finding gaps and quality issues|
extract-features|prd-to-features-prompt.md|Extract prioritized features from PRD.md into FEATURES.md|
generate-rules|prd-to-rules-prompt.md|Generate development rules and standards into RULES.md|
generate-rfcs|prd-to-rfcs-prompt.md|Break the PRD into sequential implementation RFCs|
implement-rfc|implementation-prompt-template.md|Implement a specific RFC (plan first, then code)|[rfc-id]
review-rfc|code-review-prompt.md|Review an RFC implementation against its spec and project standards|[rfc-id]
test-strategy|testing-strategy-prompt.md|Generate a test plan from features and RFCs|
manage-changes|prd-change-management-prompt.md|Analyze and integrate PRD changes mid-development|
workflow-status|workflow-status-prompt.md|Report which workflow artifacts exist and recommend the next step|
'

get_prompt() {
    local file="$1"
    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$file" ]; then
        cat "$SCRIPT_DIR/$file"
    else
        curl -fsSL "$REPO_RAW/$file"
    fi
}

write_claude() {
    local name="$1" src="$2" desc="$3" arghint="$4"
    local out="$TARGET/.claude/commands/$name.md"
    local content
    content="$(get_prompt "$src")" || { echo "Error: could not fetch $src" >&2; return 1; }
    {
        echo "---"
        echo "description: $desc"
        if [ -n "$arghint" ]; then
            echo "argument-hint: $arghint"
        fi
        echo "---"
        echo ""
        if [ -n "$arghint" ]; then
            echo 'Target RFC ID: "$ARGUMENTS" — substitute it for [ID] everywhere below. If no ID was given, ask which RFC to work on before doing anything else.'
            echo ""
        fi
        echo "$content"
    } > "$out"
    echo "  /$name -> $out"
}

write_cursor() {
    local name="$1" src="$2" desc="$3" arghint="$4"
    local out="$TARGET/.cursor/commands/$name.md"
    local content
    content="$(get_prompt "$src")" || { echo "Error: could not fetch $src" >&2; return 1; }
    {
        if [ -n "$arghint" ]; then
            echo "Target RFC: the ID provided after this command in my message — substitute it for [ID] everywhere below. If no ID was given, ask which RFC to work on before doing anything else."
            echo ""
        fi
        echo "$content"
    } > "$out"
    echo "  /$name -> $out"
}

if [ "$MODE" = "claude" ] || [ "$MODE" = "all" ]; then
    mkdir -p "$TARGET/.claude/commands"
    echo "Installing Claude Code commands:"
    echo "$COMMANDS" | while IFS='|' read -r name src desc arghint; do
        if [ -n "$name" ]; then
            write_claude "$name" "$src" "$desc" "$arghint"
        fi
    done
fi

if [ "$MODE" = "cursor" ] || [ "$MODE" = "all" ]; then
    mkdir -p "$TARGET/.cursor/commands"
    echo "Installing Cursor commands:"
    echo "$COMMANDS" | while IFS='|' read -r name src desc arghint; do
        if [ -n "$name" ]; then
            write_cursor "$name" "$src" "$desc" "$arghint"
        fi
    done
fi

echo ""
echo "Done. Open your project in Claude Code or Cursor and type / to see the commands."
echo "Start with /create-prd for a new project, or /workflow-status for an existing one."
