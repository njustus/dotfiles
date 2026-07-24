#!/bin/bash
# ASCII-styled status line for Claude Code
# Shows: token breakdown | context bar | cost | model@dir | COMPACT NOW warning

input=$(cat)

# Extract data from JSON
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
context_size=$(echo "$input" | jq -r '.context_window.context_window_size // 0')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // "~"')
dir=$(basename "$cwd")

# Context breakdown
cache_read=$(echo "$input" | jq -r '.context_window.current_usage.cache_read_input_tokens // 0')
cache_write=$(echo "$input" | jq -r '.context_window.current_usage.cache_creation_input_tokens // 0')
cur_input=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // 0')
cur_output=$(echo "$input" | jq -r '.context_window.current_usage.output_tokens // 0')

# Cost
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')

# Format numbers with K/M suffixes
fmt() {
    local num=$1
    if [ "$num" -ge 1000000 ]; then
        printf "%.1fM" $(echo "scale=1; $num/1000000" | bc)
    elif [ "$num" -ge 1000 ]; then
        printf "%.0fK" $(echo "$num/1000" | bc)
    else
        printf "%d" "$num"
    fi
}

# ╔═══════════════════╗
# ║  CLEAR SESSION    ║
# ╚═══════════════════╝
if [ "$total_in" -ge 300000 ]; then
    printf "\033[1;31m╔═══════════════════╗\033[0m\n"
    printf "\033[1;31m║\033[0m \033[1;33;5m CLEAR SESSION \033[0m  \033[1;31m║\033[0m\n"
    printf "\033[1;31m╚═══════════════════╝\033[0m "
fi

# Context bar with color coding
if [ $(echo "$used_pct >= 75" | bc -l) -eq 1 ]; then
    color="31"  # red
elif [ $(echo "$used_pct >= 35" | bc -l) -eq 1 ]; then
    color="33"  # yellow
else
    color="32"  # green
fi

filled=$(echo "$used_pct / 10" | bc)
empty=$((10 - filled))

printf "\033[2m┤\033[0m"
printf "\033[${color}m"
for ((i=0; i<filled; i++)); do printf "█"; done
printf "\033[2m"
for ((i=0; i<empty; i++)); do printf "░"; done
printf "\033[0m \033[${color}m%.0f%%\033[0m\033[2m/%s├\033[0m " "$used_pct" "$(fmt $context_size)"

# Token breakdown — what fills the context window
# context = cache_read + cache_write + input (uncached)
context_tokens=$((cache_read + cache_write + cur_input))
printf "\033[2m┤\033[0m"
printf " \033[36m⬆ %s\033[0m" "$(fmt $total_in)"
printf " \033[2m│\033[0m"
printf " \033[35m⬇ %s\033[0m" "$(fmt $total_out)"
printf " \033[2m│\033[0m"
printf " \033[33m⟳ %s\033[0m" "$(fmt $cache_read)"
printf " \033[2m│\033[0m"
printf " \033[32m✎ %s\033[0m" "$(fmt $cache_write)"
printf " \033[2m│\033[0m"
printf " \033[2mctx:\033[0m \033[97m%s\033[0m" "$(fmt $context_tokens)"
printf " \033[2m├\033[0m "

# Cost
printf "\033[2m┤\033[0m\033[93m\$%.2f\033[0m\033[2m├\033[0m " "$cost"

# Model and directory
printf "\033[2m┤\033[0m\033[34m%s\033[0m\033[2m@\033[0m\033[37m%s\033[0m\033[2m├\033[0m" "$model" "$dir"
