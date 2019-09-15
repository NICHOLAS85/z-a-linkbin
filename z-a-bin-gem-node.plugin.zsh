# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload :za-bgn-atload-handler :za-bgn-atclone-handler \
    :za-bgn-atpull-handler :za-bgn-help-handler

# An empty stub to fill the help handler fields
:za-bgn-help-null-handler() { :; }

@zplg-register-annex "z-a-bin-gem-node" \
    hook:atload \
    :za-bgn-atload-handler \
    :za-bgn-help-handler \
    "fbin''|gem''|node''" # also register new ices

@zplg-register-annex "z-a-bin-gem-node" \
    hook:atclone \
    :za-bgn-atclone-handler \
    :za-bgn-help-null-handler

@zplg-register-annex "z-a-bin-gem-node" \
    hook:%atpull \
    :za-bgn-atclone-handler \
    :za-bgn-help-null-handler

