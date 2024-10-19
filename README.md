# dotfiles

## nix-shell packages

- zsh
- fzf
- zoxide
- cascadia-code
- meslo-lg
- git
- curl
- neovim

## zsh plugins

- [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)

## zsh snippets
- vcs: git, gitignore
- sudo
- containers & orchestration: docker & kubernetes
- iac: terraform, ansible
- cloud providers: aws, gcp, azure
- package-managers: yum, dnf, npm
- python, virtualenv
- command-not-found

## Setup Instructions

1. Clone the repository:

    ```sh
    git clone --branch main --single-branch --depth=1 https://github.com/SHANMUKH-CH/dotfiles.git ~/dotfiles && cd ~/dotfiles
    ```

2. Run the setup script:

    ```sh
    bash setup.sh
    ```