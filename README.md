# Termux Dotfiles: A Modular & Minimal Setup

A clean, modular, and beautiful setup for your Termux environment. This configuration is designed to be simple to understand, easy to customize, and practical for everyday use.

## Features

- **Modular:** The installation is interactive. You choose what you want to install.
- **Minimal:** The base setup is lightweight. No unnecessary packages are installed by default.
- **Customizable:** The configuration is split into logical files, making it easy to add your own aliases, functions, and environment variables.
- **Beautiful:** Optional theming with Oh My Zsh and Powerlevel10k to make your terminal look great.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/user/repo ~/.dotfiles
    cd ~/.dotfiles
    ```
    *(Replace `https://github.com/user/repo` with the actual URL of this repository.)*

2.  **Run the installer:**
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    The script will guide you through the installation process. You will be prompted to select the components you want to install.

## Structure

This setup uses a modular structure to keep the configuration clean and organized.

-   `~/.zshrc`: The main Zsh configuration file. It's designed to be minimal and primarily sources other configuration files.
-   `~/.config/zsh/`: This directory contains all your custom configurations.
    -   `aliases.zsh`: Add your custom aliases here.
    -   `functions.zsh`: Add your custom functions here.
    -   `env.zsh`: Add your custom environment variables here.

## Customization

To customize your setup, simply edit the files in `~/.config/zsh/`.

-   **Aliases:** To add a new alias, open `~/.config/zsh/aliases.zsh` and add a new line, for example: `alias myalias="my command"`.
-   **Functions:** To add a new function, open `~/.config/zsh/functions.zsh` and define your function.
-   **Environment Variables:** To add a new environment variable, open `~/.config/zsh/env.zsh` and add a new line, for example: `export MY_VAR="my_value"`.

## Theming

During the installation, you can choose to install theming options.

-   **Oh My Zsh:** A popular framework for managing Zsh configuration. A simple, clean theme is used by default.
-   **Powerlevel10k:** A powerful and highly customizable Zsh theme. If you choose to install it, you will need to:
    1.  Restart Termux after the installation is complete.
    2.  Run the command `p10k configure` to go through the Powerlevel10k configuration wizard. This will allow you to customize your prompt to your liking.

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to open an issue or submit a pull request.
