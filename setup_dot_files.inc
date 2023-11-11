function install_dotfiles(){
    echo "******************************************"
    echo "          Installing dotfiles             "
    echo "******************************************"
    cd $GITHUB
    git clone https://github.com/maxkimambo/dotfiles.git

    if [ -f $HOME/.bashrc ]; then 
        mv $HOME/.bashrc $HOME/.bashrc.max.bak
    fi

    bash $GITHUB/dotfiles/install.sh
    echo "                  Done              "
}