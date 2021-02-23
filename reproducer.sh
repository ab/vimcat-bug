#!/bin/sh
set -eu

prompt_continue() {
    echo >&2 "Press enter to continue..."
    read -r _
}

run() {
    echo >&2 "+ $*"
    "$@"
}

if [ ! -t 0 ]; then
    echo >&2 "Expected stdin to be a ttty"
    exit 1
fi

echo "First running normal man to show man page is installed"
prompt_continue
run man timeout

echo
prompt_continue
echo "------------------------------------------------------------------------"
echo "Next running with wrapper fix to show vimcat isn't totally broken"
prompt_continue
run env MANPAGER=/wrapper.sh man timeout

echo
prompt_continue
echo "------------------------------------------------------------------------"
echo "Next running under vimcat. This will print the first line and hang."
echo "WARNING: ^C will not work!"
echo "We run under \`timeout 20...' so it doesn't brick your shell."
echo "But you may need to run \`reset' afterwards to fix the terminal."
prompt_continue

set -x
exec timeout 20 \
    env MANPAGER=/vimpager/vimcat \
    man timeout
