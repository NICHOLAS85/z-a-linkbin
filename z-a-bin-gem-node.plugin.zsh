# Copyright (c) 2019 Sebastian Gniazdowski
# License MIT

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload .za-bgn-bin-or-src-function-body \
    .za-bgn-mod-function-body \
    →za-bgn-atload-handler →za-bgn-atclone-handler \
    →za-bgn-atpull-handler →za-bgn-help-handler \
    →za-bgn-atdelete-handler \
    →za-bgn-shim-list

# An empty stub to fill the help handler fields
→za-bgn-null-handler() { :; }

@zinit-register-annex "z-a-bin-gem-node" \
    subcommand:shim-list \
    →za-bgn-shim-list \
    →za-bgn-null-handler

@zinit-register-annex "z-a-bin-gem-node" \
    hook:\!atload \
    →za-bgn-atload-handler \
    →za-bgn-help-handler \
    "fbin''|sbin|sbin''|gem''|node''|fmod''|fsrc''|ferc''" # also register new ices

@zinit-register-annex "z-a-bin-gem-node" \
    hook:atclone \
    →za-bgn-atclone-handler \
    →za-bgn-null-handler

@zinit-register-annex "z-a-bin-gem-node" \
    hook:\%atpull \
    →za-bgn-atclone-handler \
    →za-bgn-null-handler

@zinit-register-annex "z-a-bin-gem-node" \
    hook:atdelete \
    →za-bgn-atdelete-handler \
    →za-bgn-null-handler

