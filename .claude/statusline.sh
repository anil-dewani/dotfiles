#!/bin/bash

# Claude Code Statusline - Display useful session metrics
# Read JSON context from stdin
read -r context

# Check if jq is available, otherwise use basic parsing
if command -v jq &> /dev/null; then
    # Parse JSON data using jq
    model=$(echo "$context" | jq -r '.model // "unknown"')
    branch=$(echo "$context" | jq -r '.git.branch // "no-git"')
    context_used=$(echo "$context" | jq -r '.context.used // 0')
    context_limit=$(echo "$context" | jq -r '.context.limit // 200000')
    input_tokens=$(echo "$context" | jq -r '.tokens.input // 0')
    output_tokens=$(echo "$context" | jq -r '.tokens.output // 0')
    cached_tokens=$(echo "$context" | jq -r '.tokens.cached // 0')
    session_cost=$(echo "$context" | jq -r '.cost.session // 0')
    session_duration=$(echo "$context" | jq -r '.session.duration // "0m"')
else
    # Fallback: basic grep parsing if jq not available
    model=$(echo "$context" | grep -oP '"model":\s*"\K[^"]+' || echo "unknown")
    branch=$(echo "$context" | grep -oP '"branch":\s*"\K[^"]+' || echo "no-git")
    context_used=0
    context_limit=200000
    input_tokens=0
    output_tokens=0
    cached_tokens=0
    session_cost=0
    session_duration="0m"
fi

# Calculate context percentage
if [ "$context_limit" -gt 0 ]; then
    context_pct=$((context_used * 100 / context_limit))
else
    context_pct=0
fi

# Color codes for output
RESET="\033[0m"
BOLD="\033[1m"
ORANGE="\033[38;5;214m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;77m"
YELLOW="\033[38;5;227m"
PURPLE="\033[38;5;141m"
RED="\033[38;5;203m"
GRAY="\033[38;5;244m"

# Format numbers with commas
format_number() {
    printf "%'d" "$1" 2>/dev/null || echo "$1"
}

# Format cost
format_cost() {
    printf "\$%.4f" "$1" 2>/dev/null || echo "\$0.0000"
}

# Determine context color based on usage
if [ "$context_pct" -ge 80 ]; then
    CTX_COLOR="$RED"
elif [ "$context_pct" -ge 60 ]; then
    CTX_COLOR="$YELLOW"
else
    CTX_COLOR="$GREEN"
fi

# Format model name (shorten if needed)
model_short=$(echo "$model" | sed 's/claude-//' | sed 's/-202[0-9].*//')

# Build statusline output (multi-line)
echo -e "${BOLD}${ORANGE}󰧑 ${model_short}${RESET} ${GRAY}│${RESET} ${BLUE} ${branch}${RESET} ${GRAY}│${RESET} ${CTX_COLOR}󱤓 ${context_pct}%${RESET} ${GRAY}│${RESET} ${PURPLE} ${session_duration}${RESET}"
echo -e "${GREEN}󰙨 $(format_number $input_tokens)${RESET} ${GRAY}│${RESET} ${YELLOW}󰙩 $(format_number $output_tokens)${RESET} ${GRAY}│${RESET} ${BLUE}󰃨 $(format_number $cached_tokens)${RESET} ${GRAY}│${RESET} ${ORANGE}󰮯 $(format_cost $session_cost)${RESET}"
