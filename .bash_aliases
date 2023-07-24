# some more ls aliases
# See ~/dotfiles/custom_bash_completion for autocompletion of aliases
alias ll='ls -lh'
alias la='ls -lhA'
alias l='ls -CF'
alias halt='halt -p'

alias gti=git
alias gsp='git stash pop $(git stash list | fzf | cut -d=: -f1)'

# Unused
alias gco='git checkout $(git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | fzf)'
alias gci='git commit'
alias gst='git stash'
alias gsl='git stash list'
alias gs='git status'
alias gsh='git show'
alias gd='git diff'

# Somewhat used
alias ga='git add -p'
alias gh='git history'
alias gcp='git checkout -p'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias grup='git remote update -p'
alias status='git status'
alias add='git add'
alias commit='git commit -v'

alias json='python -m json.tool'
alias jvim='python -m json.tool | view +"set ft=json" -'

alias orig="find . -name '*.orig' -delete"

# ctl+f calls fg + fzf to select a job to resume
bind -x '"\C-f": fg $(jobs | fzf | sed -Ee "s/\[([0-9]+)].*/\1/")'
