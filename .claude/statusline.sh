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
    cache_write_tokens=$(echo "$context" | jq -r '.tokens.cacheWrite // 0')
    cache_read_tokens=$(echo "$context" | jq -r '.tokens.cacheRead // 0')
    session_duration=$(echo "$context" | jq -r '.session.duration // "0m"')
    working_dir=$(echo "$context" | jq -r '.cwd // ""')
else
    # Fallback: basic grep parsing if jq not available
    model=$(echo "$context" | grep -oP '"model":\s*"\K[^"]+' || echo "unknown")
    branch=$(echo "$context" | grep -oP '"branch":\s*"\K[^"]+' || echo "no-git")
    context_used=0
    context_limit=200000
    input_tokens=0
    output_tokens=0
    cached_tokens=0
    cache_write_tokens=0
    cache_read_tokens=0
    session_duration="0m"
    working_dir=""
fi

# USD to INR exchange rate (as of January 2026)
USD_TO_INR=90

# Claude API Pricing (USD per million tokens) - 2026 rates
# Source: https://platform.claude.com/docs/en/about-claude/pricing
get_model_pricing() {
    local model_name="$1"
    case "$model_name" in
        *"opus-4.5"*)
            input_price=5
            output_price=25
            cache_write_price=6.25  # typically 1.25x input
            cache_read_price=0.5    # typically 10% of input
            ;;
        *"opus-4"*)
            input_price=15
            output_price=75
            cache_write_price=18.75
            cache_read_price=1.5
            ;;
        *"sonnet-4.5"*)
            input_price=3
            output_price=15
            cache_write_price=3.75
            cache_read_price=0.3
            ;;
        *"sonnet"*)
            input_price=3
            output_price=15
            cache_write_price=3.75
            cache_read_price=0.3
            ;;
        *"haiku"*)
            input_price=1
            output_price=5
            cache_write_price=1.25
            cache_read_price=0.1
            ;;
        *)
            # Default to Sonnet pricing
            input_price=3
            output_price=15
            cache_write_price=3.75
            cache_read_price=0.3
            ;;
    esac
}

# Get pricing for current model
get_model_pricing "$model"

# Calculate cost in USD
# If cache_read/write tokens are not available, use cached_tokens as cache_read
if [ "$cache_read_tokens" -eq 0 ] && [ "$cached_tokens" -gt 0 ]; then
    cache_read_tokens=$cached_tokens
fi

cost_usd=$(awk -v inp="$input_tokens" -v out="$output_tokens" \
               -v cw="$cache_write_tokens" -v cr="$cache_read_tokens" \
               -v inp_p="$input_price" -v out_p="$output_price" \
               -v cw_p="$cache_write_price" -v cr_p="$cache_read_price" \
               'BEGIN {printf "%.6f", (inp*inp_p + out*out_p + cw*cw_p + cr*cr_p)/1000000}')

# Convert to INR
cost_inr=$(awk -v usd="$cost_usd" -v rate="$USD_TO_INR" 'BEGIN {printf "%.2f", usd*rate}')

# Calculate context percentage
if [ "$context_limit" -gt 0 ]; then
    context_pct=$((context_used * 100 / context_limit))
else
    context_pct=0
fi

# Calculate total tokens
total_tokens=$((input_tokens + output_tokens))

# Calculate cache hit rate
if [ "$input_tokens" -gt 0 ]; then
    cache_hit_rate=$((cache_read_tokens * 100 / input_tokens))
    [ "$cache_hit_rate" -gt 100 ] && cache_hit_rate=100
else
    cache_hit_rate=0
fi

# Get git changes count
git_changes=0
if git rev-parse --git-dir > /dev/null 2>&1; then
    git_changes=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
fi

# Get current time
current_time=$(date +"%H:%M")

# Color codes for output
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
ORANGE="\033[38;5;214m"
BLUE="\033[38;5;75m"
GREEN="\033[38;5;77m"
YELLOW="\033[38;5;227m"
PURPLE="\033[38;5;141m"
MAGENTA="\033[38;5;205m"
RED="\033[38;5;203m"
CYAN="\033[38;5;87m"
GRAY="\033[38;5;244m"

# Format numbers with commas
format_number() {
    printf "%'d" "$1" 2>/dev/null || echo "$1"
}

# Shorten directory path
shorten_path() {
    local path="$1"
    if [ -z "$path" ]; then
        echo "~"
        return
    fi
    # Replace home directory with ~
    path="${path/#$HOME/\~}"
    # If path is too long, show only last 2 directories
    if [ ${#path} -gt 30 ]; then
        echo "...$(echo "$path" | rev | cut -d'/' -f1,2 | rev)"
    else
        echo "$path"
    fi
}

# Determine context color based on usage
if [ "$context_pct" -ge 80 ]; then
    CTX_COLOR="$RED"
elif [ "$context_pct" -ge 60 ]; then
    CTX_COLOR="$YELLOW"
else
    CTX_COLOR="$GREEN"
fi

# Determine git changes color
if [ "$git_changes" -eq 0 ]; then
    GIT_CHG_COLOR="$GREEN"
elif [ "$git_changes" -lt 5 ]; then
    GIT_CHG_COLOR="$YELLOW"
else
    GIT_CHG_COLOR="$ORANGE"
fi

# Format model name (shorten if needed)
model_short=$(echo "$model" | sed 's/claude-//' | sed 's/-202[0-9].*//')

# Format working directory
short_dir=$(shorten_path "$working_dir")

# Build statusline output (3-line display)
# Line 1: Model, Branch, Context, Time, Directory
echo -e "${BOLD}${ORANGE}󰧑 ${model_short}${RESET} ${GRAY}│${RESET} ${BLUE} ${branch}${RESET} ${GRAY}│${RESET} ${CTX_COLOR}󱤓 ${context_pct}% ${DIM}($(format_number $context_used)/$(format_number $context_limit))${RESET} ${GRAY}│${RESET} ${PURPLE} ${session_duration}${RESET} ${GRAY}│${RESET} ${CYAN} ${current_time}${RESET}"

# Line 2: Token metrics with cache efficiency
echo -e "${GREEN}󰙨 $(format_number $input_tokens)${RESET} ${GRAY}│${RESET} ${YELLOW}󰙩 $(format_number $output_tokens)${RESET} ${GRAY}│${RESET} ${BLUE}󰃨 $(format_number $cache_read_tokens)${RESET} ${DIM}(${cache_hit_rate}%)${RESET} ${GRAY}│${RESET} ${PURPLE}󰆙 $(format_number $total_tokens) total${RESET}"

# Line 3: Cost in INR and Git status
echo -e "${ORANGE}₹ ${cost_inr}${RESET} ${DIM}INR${RESET} ${GRAY}│${RESET} ${GIT_CHG_COLOR} ${git_changes} changes${RESET} ${GRAY}│${RESET} ${DIM} ${short_dir}${RESET}"
