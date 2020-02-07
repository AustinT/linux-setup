# Make sure shell is interactive
case $- in
    *i*) ;;
      *) return;;
esac

# Useful aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Tmux stuff
export TMUX_TMPDIR=$HOME/.tmux/tmp-dir
mkdir -p "$TMUX_TMPDIR"

# Vim colors for fixing issue with truecolor terminals
if [ -f ~/.vim/bundle/vim-solarized8/scripts/solarized8.sh ]; then
    bash ~/.vim/bundle/vim-solarized8/scripts/solarized8.sh
else
    echo "WARNING: solarized colorscheme not installed correctly"
fi
