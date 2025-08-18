# Termux Dotfiles: A Modular & Minimal Setup

A clean, modular, and beautiful setup for your Termux environment. This configuration is designed to be simple to understand, easy to customize, and practical for everyday use.

## Features

- **Fully Automated:** The installation script handles everything from package installation to configuration symlinking.
- **Safe:** Automatically backs up any existing dotfiles into a timestamped directory (`~/dotfiles_backup_*`) before installation.
- **Modular:** The installation is interactive. You choose what you want to install.
- **Minimal:** The base setup is lightweight. No unnecessary packages are installed by default.
- **Customizable:** The configuration is split into logical files, making it easy to add your own aliases, functions, and environment variables.
- **Beautiful:** Optional theming with Oh My Zsh and Powerlevel10k to make your terminal look great.

## Installation

Installation is simple. Just clone the repository and run the installer.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/vjaykrsna/Termux-Setup.git ~/.dotfiles
    cd ~/.dotfiles
    ```
    *(Replace `https://github.com/user/repo` with the actual URL of this repository.)*

2.  **Run the installer:**
    ```bash
    ./install.sh
    ```
    The script will guide you through the installation process. It will automatically handle permissions, create backups of your existing files, and set up the necessary symlinks.

## Structure

This setup uses a modular structure to keep the configuration clean and organized. The installer symlinks the files from this repository to your home directory.

-   `~/.zshrc`: A symlink to the `.zshrc` file in this repository.
-   `~/.config/`: A symlink to the `.config` directory in this repository.
    -   `zsh/aliases.zsh`: Add your custom aliases here.
    -   `zsh/functions.zsh`: Add your custom functions here.
    -   `zsh/env.zsh`: Add your custom environment variables here.

## Customization

To customize your setup, **edit the files within this cloned repository**, not the symlinked files in your home directory. Your changes will be reflected automatically.

-   **Aliases:** To add a new alias, open `.config/zsh/aliases.zsh` in this repository and add a new line.
-   **Functions:** To add a new function, open `.config/zsh/functions.zsh` in this repository and define your function.
-   **Environment Variables:** To add a new environment variable, open `.config/zsh/env.zsh` in this repository and add a new line.

## Theming

During the installation, you can choose to install theming options.

-   **Oh My Zsh:** A popular framework for managing Zsh configuration. A simple, clean theme is used by default.
-   **Powerlevel10k:** A powerful and highly customizable Zsh theme. If you choose to install it, you will need to:
    1.  Restart Termux after the installation is complete.
    2.  Run the command `p10k configure` to go through the Powerlevel10k configuration wizard. This will allow you to customize your prompt to your liking.

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to open an issue or submit a pull request.
