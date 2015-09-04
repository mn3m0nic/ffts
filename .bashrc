
### Git 
### http://habrahabr.ru/post/28268/
alias gst='git-status'
alias ga='git-add'
alias gc='git-commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git-branch'
alias gco='git-checkout'
alias gd='git-diff'

### Workflow
#1) Что-то пописали, прогнали тесты
#2) $ gst — увидели, какие файлы новые, какие обновленные.
#3) $ ga a b c — добавили новые и обновленные файлы в индекс.
#4) $ gc 'something is done' — записали коммит в репозиторий
#5) Снова что-то написали, снова закоммитили.
#6) $ gp — слили чужие изменения, залили свои изменения. Если вдруг возник конфликт, вам об этом напишут, будете мерджить.
#grep ^flags /proc/cpuinfo|grep -qs sse2 && echo OK || echo SSE_not_exist


###  Directory navigation

function md ()
{
        mkdir -p "$@" 
        #eval cd "\"\$$#\""
        cd "$@"
        #ls -lah 
}

export MARKPATH=$HOME/.marks
function jump {
        if [ -L "$MARKPATH/$1" ]; then
                cd -P $MARKPATH/$1 2> /dev/null
                if [ ! -z "$2" ]; then
                        if [ -d "$2" ]; then
                                cd -P $2 2> /dev/null
                        else
                                echo "No such subdir: $2"
                        fi
                fi
        else
                echo "No such mark: $1"
        fi
}

function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- && echo
}
function _jump {
      local cur=${COMP_WORDS[COMP_CWORD]}
      local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
      COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
      return 0
}

function remark {
        echo "Remark dir $(pwd) to \"$1\" ?[yn] "
        read a
        if [ ! -z "$1" ]&&[ "$a" == "y" ]; then
                rm $MARKPATH/$1
                mkdir -p $MARKPATH;
                ln -s $(pwd) $MARKPATH/$1
        fi

}
complete -o default -o nospace -F _jump jump

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
