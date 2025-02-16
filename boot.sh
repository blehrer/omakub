set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

LOCAL_OMAKUB_PATH=~/code/omakub
INSTALL_PATH=~/.local/share/omakub

echo "Copying local Omakub..."
rm -rf "$INSTALL_PATH"
cp -r "$LOCAL_OMAKUB_PATH" "$INSTALL_PATH"

echo "Installation starting..."
source "$INSTALL_PATH/install.sh"

echo "Cloning Omakub-zsh..."
rm -rf ~/.local/share/omakub
git clone https://github.com/jakanav-swivel/omakub-zsh.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
