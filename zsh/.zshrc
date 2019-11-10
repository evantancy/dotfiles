# load zplugin module, use zpmod -h for help
module_path+=( "$HOME/.zplugin/bin/zmodules/Src" )
zmodload zdharma/zplugin

source ~/.zplugin/bin/zplugin.zsh

# https://superuser.com/questions/480928/is-there-any-command-like-time-but-for-memory-usage/767491
TIMEFMT='%J    user:%U system:%S cpu:%P total:%*E'$'\nmax memory:	%M MB'

# rustup mirror
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# speed up rustc compile
# removed because all cache has be placed in ~/.cache/cargo-build
# export RUSTC_WRAPPER=sccache

# Dolphin 下禁用 tmux 以便使用 z 快速跳转目录
# https://www.reddit.com/r/tmux/comments/a2e5mn/tmux_on_dolphin_inbuilt_terminal/
if [[ -z "$TMUX" && $- == *i* ]] {
    local windowname=$(xdotool getactivewindow getwindowname)
    [[ "$windowname" != *"Dolphin"* ]] && exec tmux
}

# for better oh-my-zsh experience

DISABLE_LS_COLORS=true

zplg ice lucid wait='1'
zplg light paulirish/git-open

zplg ice lucid wait='0'
zplg light skywind3000/z.lua

zplg ice lucid wait='0' atinit='zpcompinit'
zplg light zdharma/fast-syntax-highlighting

zplg ice wait lucid atload='_zsh_autosuggest_start'
zplg light zsh-users/zsh-autosuggestions

zplg ice lucid wait='0'
zplg light zsh-users/zsh-completions

zplg ice wait="1" lucid as="program" pick="bin/git-dsf"
zplg light zdharma/zsh-diff-so-fancy

zplg ice lucid wait="1"
zplg snippet /home/aloxaf/.travis/travis.sh

zplg ice svn
zplg snippet OMZ::plugins/extract
zplg snippet OMZ::lib/completion.zsh
zplg snippet OMZ::lib/history.zsh
zplg snippet OMZ::lib/key-bindings.zsh
zplg snippet OMZ::lib/theme-and-appearance.zsh
zplg snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplg snippet OMZ::plugins/sudo/sudo.plugin.zsh

zplg ice lucid wait='0'
zplg snippet OMZ::plugins/git/git.plugin.zsh

CUSTOM=~/.config/zsh/custom

#zplg snippet $CUSTOM/themes/loli.zsh-theme
zplg snippet $CUSTOM/plugins/alias.plugin.zsh
zplg snippet $CUSTOM/plugins/fuzzy.plugin.zsh
zplg snippet $CUSTOM/plugins/rgcdda.plugin.zsh

zplg ice pick"async.zsh" src"pure.zsh"
zplg light sindresorhus/pure
