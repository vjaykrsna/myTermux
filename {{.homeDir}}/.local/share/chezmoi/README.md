# Termux Dotfiles (Managed by chezmoi)

A clean, modular, and beautiful setup for your Termux environment, now managed by [chezmoi](https://chezmoi.io).

## Installation

This setup is managed by `chezmoi`, a powerful dotfile manager. To install, you will need to have `chezmoi` and `git` installed.

1.  **Install `chezmoi`:**
    ```bash
    pkg install chezmoi
    ```

2.  **Initialize `chezmoi` with this repository:**
    Replace `YOUR_GITHUB_USERNAME/YOUR_REPO_NAME` with the actual URL of this repository.
    ```bash
    chezmoi init --apply https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME
    ```
    You will be prompted to choose which optional components to install.

## Structure

This setup is organized according to `chezmoi`'s conventions. The source files are located in `~/.local/share/chezmoi`.

-   **Dotfiles:** Files like `.zshrc` are stored as `dot_zshrc` in the source directory.
-   **Configuration:** The `.config` directory is stored as `dot_config`.
-   **Installation Scripts:** Package installations are handled by `run_` scripts, which are executed automatically by `chezmoi`.
-   **Modular Components:** You can choose which components to install during the `chezmoi init` process. This is configured in the `.chezmoi.toml.tmpl` file.

## Customization

To customize your setup, edit the files in the `chezmoi` source directory (`~/.local/share/chezmoi`) and then run `chezmoi apply` to apply the changes.

-   **Aliases:** Edit `dot_config/zsh/aliases.zsh`.
-   **Functions:** Edit `dot_config/zsh/functions.zsh`.
-   **Environment Variables:** Edit `dot_config/zsh/env.zsh`.
