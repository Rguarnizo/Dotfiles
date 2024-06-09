ln -s ~/dotfiles/.* ~/


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file ~/dotfiles/Brewfile


defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.finder "QuitMenuItem" -bool "true" && killall Finder
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 
defaults write -globalDomain NSUserKeyEquivalents -dict-add "Move focus to next window" '⌥\t'


git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

