# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Original work Copyright (c) 2019-2020 Sebastian Gniazdowski
# Modified work Copyright (c) 2020 Nicholas Serrano
# Copyright (c) 2022 Z-Shell Community
#
# License MIT

# Standardized $0 Handling
# https://z.digitalclouds.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Functions directory
# https://z.digitalclouds.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]] {
    fpath+=( "${0:h}/functions" )
}

# https://z.digitalclouds.dev/community/zsh_plugin_standard#the-proposed-function-name-prefixes
autoload -Uz →za-lb-atclone-handler →za-lb-atdelete-handler

# An empty stub to fill the help handler fields
→za-lb-null-handler() { :; }

@zi-register-annex "z-a-linkbin" hook:atclone-50 \
  →za-lb-atclone-handler \
  →za-lb-null-handler \
  "lbin|lbin''" # also register new ices

@zi-register-annex "z-a-linkbin" hook:\%atpull-50 \
  →za-lb-atclone-handler \
  →za-lb-null-handler

@zi-register-annex "z-a-linkbin" hook:atdelete-50 \
  →za-lb-atdelete-handler \
  →za-lb-null-handler
