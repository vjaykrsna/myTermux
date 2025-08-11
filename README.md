# Termux Environment Setup

This repository contains a `.zshrc` configuration and a setup script to quickly configure a powerful development environment in Termux.

## Instructions

### Step 1: Change Repository (Recommended)

For faster downloads, it's highly recommended to switch to a better package repository before running the setup script. Run the following command and select a mirror that is close to you:

```bash
termux-change-repo
```

### Step 2: Run the Setup Script

Make the setup script executable and then run it.

```bash
chmod +x setup.sh
./setup.sh
```

The script will:
- Update all packages.
- Install a curated list of development tools, languages, and utilities.
- Configure shell essentials.

### Step 3: Reload Your Shell

Once the script is finished, reload your Zsh configuration to apply all the changes.

```bash
source ~/.zshrc
```

Your Termux environment is now ready!
