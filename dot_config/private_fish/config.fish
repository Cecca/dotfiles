if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases and abbreviations
alias l=exa
alias ll='exa -l'
alias ltex='latexmk -silent -pdf -aux-directory=.latex.out'
alias wtex='latexmk -pdf -quiet -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode" -pvc -bibtex'

set -gx EDITOR nvim

starship init fish | source
zoxide init fish | source

fish_add_path ~/.ideaIC-2022.3.3/idea-IC-223.8836.39/bin/

source /home/matteoceccarello/.nix-profile/etc/profile.d/nix.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/matteoceccarello/.mambaforge/bin/conda "shell.fish" "hook" $argv | source

if test -f "/home/matteoceccarello/.mambaforge/etc/fish/conf.d/mamba.fish"
    source "/home/matteoceccarello/.mambaforge/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

