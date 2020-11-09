# Copyright (c) 2019-2020 Sebastian Gniazdowski
# License MIT

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload :za-lb-atclone-handler :za-lb-atdelete-handler

# An empty stub to fill the help handler fields
:za-lb-null-handler() { :; }

#@zinit-register-annex "z-a-linkbin" \
#    subcommand:link-list \
#    :za-lb-list \
#    :za-lb-help-handler


@zinit-register-annex "z-a-linkbin" \
    hook:atclone-50 \
    :za-lb-atclone-handler \
    :za-lb-null-handler \
    "lbin|lbin''" # also register new ices

@zinit-register-annex "z-a-linkbin" \
    hook:\%atpull-50 \
    :za-lb-atclone-handler \
    :za-lb-null-handler

@zinit-register-annex "z-a-linkbin" \
    hook:atdelete-50 \
    :za-lb-atdelete-handler \
    :za-lb-null-handler

