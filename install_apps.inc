function install_apps(){
    if ! command -v xcode-select &>/dev/null; then
  echo "xcode-select not found. Installing ..."
  sudo xcode-select --install
fi

# Check if brew is in the PATH
if ! command -v brew &>/dev/null; then
  echo "Homebrew (brew) not found. Installing Homebrew..."
  /bin/bash -c NONINTERACTIVE=1 "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile  # You can change the shell profile file accordingly (e.g., .bashrc, .zshrc)
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  	echo "Homebrew (brew) found in PATH. Updating Homebrew..."
	brew update --force --quiet
fi

# Install packages 
# set brew into non interactive mode
export NONINTERACTIVE=1
export HOMEBREW_NO_ENV_HINTS=1
echo "Installing selected software packages"
BREW_PKGS=(
	bash
	curl
	git
	mas
	wget
	go
	node
	nvm
	tree
	terraform
	kubernetes-cli
	tmux
    jq
    postman
	ripgrep
)

for i in "${BREW_PKGS[@]}"
do
	if brew list $i &> /dev/null; then 
		brew upgrade $i
	else 
		brew install $i
	fi 
done

CASKS=(
	iterm2
	miniconda
	raycast
	rectangle
	visual-studio-code
	balenaetcher
	slack
	telegram
	whatsapp
	spotify
	keyclu
)

for c in "${CASKS[@]}"
do 
	if brew list $c &> /dev/null; then 
		brew upgrade --cask $c
	else 
    	brew install --cask $c
	fi
done 

mas_apps=(
    937984704
)

Echo "Installing additional software from app store" 
for app in "${mas_apps[@]}"
do 
    mas install $app 
done


echo "Installing sdk man \r\n"

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk selfupdate force

mkdir -p $HOME/bin

if [ ! -e /Users/kimambo/bin/google-cloud-sdk/bin/gcloud ]; then 

	cd $HOME/bin && curl  https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-451.0.1-darwin-arm.tar.gz -o gcloud-cli.tar.gz


	tar xf gcloud-cli.tar.gz 
	rm gcloud-cli.tar.gz
	
	bash -c ./google-cloud-sdk/install.sh --disable-prompts --install-dir=$HOME/bin/google-cloud-sdk
	bash -c $HOME/bin/google-cloud-sdk/bin/gcloud init --disable-prompts
else 
 	echo "Google cli found ... skipping install" 
fi 

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
}