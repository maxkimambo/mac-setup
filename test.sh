# apps={
#    google-chrome
#  visual-studio-code 
#  docker
#  skype
#  spotify
#  telegram
#  iterm2
#  spectacle
#  firefox
#  postman
#  vlc
#  mattermost
#  adobe-acrobat-reader
#  keepassx
# }

vscode=(
  donjayamanne.python
  dragos.scala-lsp
  lukehoban.Go
  ms-vscode.cpptools
  rebornix.Ruby
  redhat.java
)

function install {
    cmd=$1 
    
    for app in $@
    do 
        echo "installing .... $app"
    done 
}

install  ${vscode[@]}
    