rm -rf ~/.dotfiles
mkdir ~/.dotfiles
cp -r ./* ~/.dotfiles

rm ~/.local/bin/inputleap-start
mkdir -p ~/.local/bin
ln -s ~/.dotfiles/inputleap/inputleap-start.sh ~/.local/bin/inputleap-start
chmod +x ~/.local/bin/inputleap-start

rm ~/.config/systemd/user/inputleap.service
mkdir -p ~/.config/systemd/user
ln -s ~/.dotfiles/inputleap/inputleap.service  ~/.config/systemd/user/inputleap.service 

systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable inputleap.service
systemctl --user start inputleap.service
