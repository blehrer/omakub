# Configure the bash shell using Omakub defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omakub/defaults/bash/shell

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  rm -rf ~/.oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Configure the zsh shell using Omakub defaults
echo 'source ~/.local/share/omakub/defaults/zsh/rc' >> ~/.zshrc

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Load the PATH for use later in the installers
if [ -f ~/.local/share/omakub/defaults/zsh/shell ]; then
  source ~/.local/share/omakub/defaults/zsh/shell
fi

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omakub defaults
cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
