# RUN: %fish %s

set repo $PWD
set test_home /tmp/tide-vscode-clear-screen-test
mkdir -p $test_home/.config/fish

env HOME=$test_home XDG_CONFIG_HOME=$test_home/.config VSCODE_INJECTION=1 fish -ic "\
function commandline
    echo cmd:\$argv
end
function __vsc_update_cwd
    echo updated
end
source $repo/conf.d/_tide_vscode.fish
bind | string match '*_tide_vscode_clear_screen*'
_tide_vscode_clear_screen" | string collect
# CHECK: bind ctrl-l _tide_vscode_clear_screen
# CHECK: cmd:-f cmd:clear-screen
# CHECK: updated
