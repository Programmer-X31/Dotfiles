
ZSH_THEME=robbyrussell
#########################################################################
############################   EXPORTS   ################################
#########################################################################

export LANG=en_US.UTF-8
export TERM="xterm-256color"                      # getting proper colors
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin"
export XDG_SESSION_TYPE=x11
export UPDATE_ZSH_DAYS=13


#########################################################################
##########################    OH-MY-ZSH    ##############################
#########################################################################
#
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found
         git
         zsh-autosuggestions
         zsh-syntax-highlighting
         history)

source $ZSH/oh-my-zsh.sh

#########################################################################
############################   ALIASES   ################################
#########################################################################
alias ls="eza -al --icons=always --group-directories-first"
alias tree="eza --icons=always --group-directories-first -T" 
alias files="nautilus . &"
alias vim="nvim"
alias doom="~/.config/emacs/bin/doom"

alias pocnfg='nvim ~/.config/polybar/config.ini'
alias xcnfg='nvim ~/.config/xmonad/xmonad.hs'
alias kcnfg='nvim ~/.config/kitty/kitty.conf'
alias acnfg='nvim ~/.config/alacritty/alacritty.toml'
alias picnfg='nvim ~/.config/picom/picom.conf'
alias zcnfg='nvim ~/.zshrc'
alias ccnfg='nvim ~/.config/conky/mocha.conkyrc'
alias ncnfg='nvim ~/.config/nvim/lua/custom/init.lua'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rms='rmtrash'
alias fs='fc-list | grep'



#########################################################################
############################  FUNCTIONS  ################################
#########################################################################
function ex {
    if [ -z "$1" ]; then
       # display usage if no parameters given
       echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
       echo "       ex <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"
        do
            if [ -f "$n" ] ; then
                case "${n%,}" in
                    *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                        tar xvf "$n"       ;;
                    *.lzma)      unlzma ./"$n"      ;;
                    *.bz2)       bunzip2 ./"$n"     ;;
                    *.cbr|*.rar)       unrar x -ad ./"$n" ;;
                    *.gz)        gunzip ./"$n"      ;;
                    *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
                    *.z)         uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                              7z x ./"$n"        ;;
                    *.xz)        unxz ./"$n"        ;;
                    *.exe)       cabextract ./"$n"  ;;
                    *.cpio)      cpio -id < ./"$n"  ;;
                    *.cba|*.ace)      unace x ./"$n"      ;;
                    *)
                    echo "extract: '$n' - unknown archive method"
                    return 1
                    ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
           fi
        done
   fi
}



