# config.nu
#
# Installed by:
# version = "0.115.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#
$env.config.edit_mode = 'vi'
$env.config.cursor_shape.vi_insert = 'block'
$env.config.cursor_shape.vi_normal = 'underscore'

$env.PROMPT_INDICATOR_VI_INSERT = ''
$env.PROMPT_INDICATOR_VI_NORMAL = ''

$env.config.keybindings = ($env.config.keybindings | append {
    name: accept_suggestion
    modifier: control
    keycode: char_f
    mode: [vi_insert vi_normal]
    event: { send: HistoryHintComplete }
})

source ($nu.default-config-dir | path join 'vendor/autoload/starship.nu')
source $"($nu.cache-dir)/carapace.nu"
source ~/.zoxide.nu
