#!/bin/bash 

#disable motion sensor on ssd macs 
sudo pmset -a sms 0

# Install X-code cmdline tools 
sudo xcode-select --install

if ! [ -e `which brew` ]; then 
    echo "installing brew"
    # Install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


brew install curl
brew install git
brew install markdown
brew install node
brew install python3
brew install rsync
brew install wget
brew install tree 

brew cask install google-chrome
brew cask install visual-studio-code 
brew cask install docker
brew cask install skype
brew cask install spotify
brew cask install telegram
brew cask install iterm2
brew cask install spectacle
brew cask install firefox
brew cask install postman
brew cask install vlc
brew cask install adobe-acrobat-reader
brew cask install java 
brew cask install eclipse-java



# install zsh and oh-my-zsh 
brew install zsh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)


# Extensions 
code --install-extension DanielThielking.aws-cloudformation-yaml
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension formulahendry.code-runner
code --install-extension jinsihou.diff-tool
code --install-extension joelday.docthis
code --install-extension JPTarquino.postgresql
code --install-extension ms-mssql.mssql
code --install-extension ms-python.python
code --install-extension PeterJausovec.vscode-docker
code --install-extension stkb.rewrap
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.python
code --install-extension eamodio.gitlens
code --install-extension jinsihou.diff-tool
code --install-extension joelday.docthis
code --install-extension lukehoban.Go
code --install-extension ms-vscode.azure-account

