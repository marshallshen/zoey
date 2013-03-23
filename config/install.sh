if [ -d ~/.zoey ]
then
  echo "\033[0;33mYo, I think you already have me installed.\033[0m I suggest to remove ~/.zoey But I will let Deciders decide I am just a suggestor!"
  exit
fi

echo "\033[0;34mCloning Zoey...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/marshallshen/zoey.git ~/.zoey || {
  echo "git not installed"
  exit
}

echo "\033[0;34mInstalling Zoey...\033[0m"
if [-d ~/.zoey]
then
  filename = "~/.zoey/lib/zoey.rb"
  chmod +x "$filename"
  echo "Zoey installed"
  exit
fi

# add zoey alias
# alias zoey="./~/./zoey/lib/zoey.rb"

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-zoey\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-zoey;
fi

echo "\033[0;34mUsing the Zoey template file and adding it to ~/.zshrc\033[0m"
cp ~/.zoey/templates/zshrc.zsh-template ~/.zshrc

echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
echo "export PATH=$PATH" >> ~/.zshrc

echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
chsh -s `which zsh`

# echo "\033[0;32m"'         __                                     __   '"\033[0m"
# echo "\033[0;32m"'  ____  / /_     ____ ___  __  __   ____  _____/ /_  '"\033[0m"
# echo "\033[0;32m"' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '"\033[0m"
# echo "\033[0;32m"'/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '"\033[0m"
# echo "\033[0;32m"'\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '"\033[0m"
# echo "\033[0;32m"'                        /____/                       '"\033[0m"

echo "\033[0;32m"' _______ _______ _______         '"\033[0m"
echo "\033[0;32m"'/ ___   |  ___  |  ____ \\     /|'"\033[0m"
echo "\033[0;32m"'\/   )  | (   ) | (    \( \   / )'"\033[0m"
echo "\033[0;32m"'    /   ) |   | | (__    \ (_) / '"\033[0m"
echo "\033[0;32m"'   /   /| |   | |  __)    \   /  '"\033[0m"
echo "\033[0;32m"'  /   / | |   | | (        ) (   '"\033[0m"
echo "\033[0;32m"' /   (_/\ (___) | (____/\  | |   '"\033[0m"
echo "\033[0;32m"'(_______(_______|_______/  \_/   '"\033[0m"

echo "\n\n \033[0;32m....is now installed.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
