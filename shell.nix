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
        pkgs.cascadia-code
        pkgs.meslo-lg
        pkgs.git
        pkgs.curl
        pkgs.vscode
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

        # Link .zshrc and .p10k.zsh from the parent directory
        ln -sf $PWD/.zshrc $HOME/.zshrc
        ln -sf $PWD/.p10k.zsh $HOME/.p10k.zsh

        # Start zsh
        exec $(which zsh)
    '';
}