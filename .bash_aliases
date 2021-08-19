# some more ls aliases
alias ll='ls -lh'
alias la='ls -lhA'
alias l='ls -CF'
alias halt='halt -p'

alias gco='git checkout $(git branch | grep -v $(git rev-parse --abbrev-ref HEAD) | fzf)'
alias gsp='git stash pop $(git stash list | fzf | cut -d=: -f1)'

alias ga='git add -p'
alias gci='git commit'
alias gst='git stash'

alias gsl='git stash list'
alias gs='git status'
alias gsh='git show'
alias gd='git diff'
alias gh='git history'
alias gmt='git mergetool'
alias grup='git remote update -p'

alias json='python -m json.tool'
alias jvim='python -m json.tool | view +"set ft=json" -'

# ctl+f calls fg + fzf to select a job to resume
bind -x '"\C-f": fg $(jobs | fzf | sed -Ee "s/\[([0-9]+)].*/\1/")'
