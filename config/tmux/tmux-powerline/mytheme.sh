# Default Theme

TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'255'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'0'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"hostname 255 33" \
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		"vcs_branch 255 88" \
		"vcs_compare 255 0" \
		"vcs_staged 255 0" \
		"vcs_modified 255 0" \
		"vcs_others 255 0" \
		"pwd 255 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
		#"macos_notification_count 29 255" \
		#"cpu 240 136" \
		#"load 237 167" \
		"tmux_mem_cpu_load 255 136" \
		"battery 255 127" \
		"weather 255 0" \
		#"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
		#"xkb_layout 125 117" \
		"date_day 255 136" \
		"date 255 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"time 255 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
