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

rm ~/.config/systemd/user/inputleap-checker.service
mkdir -p ~/.config/systemd/user
ln -s ~/.dotfiles/inputleap/inputleap-checker.service  ~/.config/systemd/user/inputleap-checker.service

rm ~/.config/systemd/user/inputleap-checker.timer
mkdir -p ~/.config/systemd/user
ln -s ~/.dotfiles/inputleap/inputleap-checker.timer  ~/.config/systemd/user/inputleap-checker.timer

systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl   --user enable --now   inputleap.service
systemctl   --user enable --now  inputleap-checker.timer
