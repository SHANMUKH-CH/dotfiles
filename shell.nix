# shell.nix

let
    pkgs = import <nixpkgs> {
        config = {
            allowUnfree = true;
        };
    };

in pkgs.mkShell {
    buildInputs = [
        pkgs.zsh
        pkgs.fzf
        pkgs.zoxide
        pkgs.git
        pkgs.curl
    ];
    shellHook = ''
        fc-cache -f -v

        # Set zsh as the default shell
        export SHELL=$(which zsh)

        # Install zinit if not already installed
        if [ ! -d "$HOME/.local/share/zinit/zinit.git" ]; then
            mkdir -p "$HOME/.local/share/zinit"
            git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
        fi

        # Link config files from the parent directory
        ln -sf $PWD/.zshrc $HOME/
        ln -sf $PWD/.p10k.zsh $HOME/
        ln -sf $PWD/scripts/common.sh $HOME/

        # Start zsh
        exec $(which zsh)
    '';
}