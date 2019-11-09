set PATH /usr/local/lib/ruby/gems/2.6.0/bin /usr/local/opt/ruby/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH

set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%m/%d/%y %H:%M:%S %Z day %j"

alias ls="ls -a1"
alias latexmk="docker run -v (pwd):/root/work -it nontan18/texlive:stable latexmk"
