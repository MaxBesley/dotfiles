#!/bin/bash
# This script is intended to solve the "chicken and egg"
# problem of bootstrapping a new computer.
# Run this once on a new Linux machine and it
# will install and configure software.


# To make sure this script is only run once
if ! [ -z "$BOOTSTRAP_COMPLETE" ]; then
   case $BOOTSTRAP_COMPLETE in
       1)
           echo "Already run. Exiting." ;;
       *)
           echo "Something went wrong." ;;
   esac
   return 0
fi

err_exit() {
    echo "Error: $1"
    exit 1
}

# Global variables
ICON="==>"
TO_INSTALL="git curl stow ansible"
DOTFILES_DIR="$HOME/.dotfiles"
ANSIBLE_DIR="$DOTFILES_DIR/ansible"
GITHUB_REPO="https://github.com/MaxBesley/dotfiles"


# Restrict to only a few OSes
if [ "$OSTYPE" != "linux-gnu" ]; then
    err_exit "Only linux is supported"
elif ! [[ "$(lsb_release -si)" =~ ^(Ubuntu|Debian|Pop|Linuxmint)$ ]]; then
    err_exit "Your linux distribution is not supported"
fi

# Update the linux system packages
echo "$ICON Updating the system ..."
sudo apt update && sudo apt -y upgrade

# Install the programs we need
for p in $TO_INSTALL; do
    if ! command -v $p &>/dev/null; then
        echo "$ICON Installing $p ..."
        sudo apt -y install $p
    fi
done

# Download the dotfiles
if ! [ -d "$DOTFILES_DIR" ]; then
    echo "$ICON Cloning dotfiles into $DOTFILES_DIR ..."
    git clone $GITHUB_REPO $DOTFILES_DIR
fi

# Run the Ansible playbook
echo "$ICON Running Ansible playbook ..."
cd $ANSIBLE_DIR && ansible-playbook --ask-become-pass toplevel.yml

# Run GNU stow
echo "$ICON Establishing symlinks using GNU stow ..."
cd $DOTFILES_DIR && stow --verbose .

# Record the fact that this computer was bootstrapped
echo "$ICON BOOTSTRAPPING DONE!"
echo "# DO NOT CHANGE THIS!" >> $DOTFILES_DIR/.bash_misc
echo "export BOOTSTRAP_COMPLETE=1" >> $DOTFILES_DIR/.bash_misc

