# Termux Dotfiles with Chezmoi

A clean, modular, and beautiful setup for your Termux environment, now managed with [chezmoi](https://chezmoi.io). This configuration is designed to be simple to install, easy to customize, and practical for everyday use.

## Features

- **Automated with Chezmoi:** The entire setup is managed by `chezmoi`, a powerful dotfile manager.
- **Simple Installation:** A single command is all you need to get started.
- **Modular and Scriptable:** The configuration is modular, and `chezmoi` handles the execution of installation scripts for tools and applications.
- **Customizable:** The configuration is split into logical files, making it easy to add your own aliases, functions, and environment variables.
- **Beautiful:** Comes with the Starship prompt, a minimal and fast cross-shell prompt.

## Prerequisites

Before you begin, you need to have `git` and `chezmoi` installed on your Termux.

1.  **Install Git:**
    ```bash
    pkg install git
    ```

2.  **Install Chezmoi:**
    ```bash
    pkg install chezmoi
    ```

## Installation

To install the dotfiles, run the following command:

```bash
chezmoi init --apply <your-repo-url>
```

Replace `<your-repo-url>` with the URL of this repository. `chezmoi` will clone the repository, apply the dotfiles, and run all the necessary installation scripts.

## Structure

This setup uses `chezmoi` to manage the dotfiles. The source files are located in this repository, and `chezmoi` applies them to your home directory.

-   `dot_zshrc`: This is the template for your `~/.zshrc` file.
-   `dot_config/`: This directory contains the configuration for various tools. It will be mapped to `~/.config/`.
-   `.chezmoiscripts/`: This directory contains scripts that are run by `chezmoi` during the `apply` process. These scripts install tools and applications.
-   `bin/`: This directory contains custom scripts that will be symlinked to `~/.local/bin/`.

## Customization

To customize your setup, you need to edit the files in your `chezmoi` source directory.

1.  **Find your `chezmoi` source directory:**
    ```bash
    chezmoi source-path
    ```

2.  **Edit the files:**
    -   To add a new alias, edit `dot_config/zsh/aliases.zsh`.
    -   To add a new function, edit `dot_config/zsh/functions.zsh`.
    -   To add a new environment variable, edit `dot_config/zsh/env.zsh`.

3.  **Apply the changes:**
    ```bash
    chezmoi apply
    ```

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to open an issue or submit a pull request.
