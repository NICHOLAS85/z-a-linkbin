# zinit-annex-binary-symlink<a name="z-a-linkbin"></a>

<!-- mdformat-toc start --slug=github --maxlevel=6 --minlevel=2 -->

- [Installation](#installation)
- [How it works](#how-it-works)
- [The Ice Modifiers Provided By The Annex](#the-ice-modifiers-provided-by-the-annex)
  - [`lbin'[!]{path-to-binary}[ -> {name-of-the-script}]'`](#lbinpath-to-binary---name-of-the-script)

<!-- mdformat-toc end -->

A Zsh-Zinit annex (i.e. an extension) that provides functionality, which allows to:

1. Run programs and scripts without adding anything to `$PATH` via the automatic creation of **links** in `$ZPFX/bin`

## Installation<a name="installation"></a>

Simply load like a regular plugin, i.e.:

```zsh
zinit light zdharma-continuum/zinit-annex-binary-symlink
```

After executing this command you can then use the new ice-mods provided by the annex.

## How it works<a name="how-it-works"></a>

Exposing a binary program without modifying `$PATH` – `zinit-annex-binary-symlink` will automatically create a hard or
soft link to the binary in `$ZPFX/bin` exposing the program to the command line as if it were being placed in `$PATH`.

The command can then be accessed normally – not only in the live Zsh session, but also from any Zsh script.

## The Ice Modifiers Provided By The Annex<a name="the-ice-modifiers-provided-by-the-annex"></a>

There is 1 ice-modifier provided and handled by this annex. They are:

1. `lbin''` – creates `links` for binaries and scripts.

**The ice-modifier in detail:**

### `lbin'[!]{path-to-binary}[ -> {name-of-the-script}]'`<a name="lbinpath-to-binary---name-of-the-script"></a>

It creates the `link` that calls the actual binary. The link is created always under the same, standard and single
`$PATH` entry: `$ZPFX/bin` (which is `~/.zinit/polaris/bin` by default).

The optional preceding `!` flag means create a soft link instead of a hard link.

Example:

```zsh
% zinit ice from"gh-r" lbin"!fzf"
% zinit load junegunn/fzf-bin
…installation messages…
% ls -l $ZPFX/bin/ | awk '{print $(NF-2),$(NF-1),$NF}'
fzf -> /home/sg/.zinit/plugins/junegunn---fzf-bin/fzf
% fzf --version
0.23.1 (fc7630a)
```

**The ice can contain globs**. It will expand these when searching for the binary.

Example:

```zsh
% zinit ice from"gh-r" lbin"**fzf -> myfzf"
% zinit load junegunn/fzf-bin
…installation messages…
% ls $ZPFX/bin/
myfzf
% myfzf --version
0.23.1 (fc7630a)
```

**The ice can be empty**. It will then try to create the link for:

- trailing component of the `id_as` ice, e.g.: `id_as'exts/git-my'` → it'll check if a file `git-my` exists and if yes,
  create the link `git-my`,
- the plugin name, e.g.: for `paulirish/git-open` it'll check if a file `git-open` exists and if yes, create the link
  `git-open`,
- trailing component of the snippet URL,
- for any alphabetically first executable file.

> **Note**: The above also applies if only `!` is passed.
