echo "\033[;34mChecking Ruby.. \033[0m"
which ruby >/dev/null && echo "Ruby is installed" || {
  echo "ruby is not installed"
  exit
}

if [ -d ~/.zoey ]
then
  echo "\033[0;33mYo, I think you already have me installed.\033[0m"
  echo "\033[0;33mI suggest to remove ~/.zoey But I will let Deciders decide I am just a suggestor!\033[0m"
  exit
fi

echo "\033[0;34mCloning Zoey...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/marshallshen/zoey.git ~/.zoey || {
  echo "git not installed"
  exit
}

echo "\033[0;32m"' _______ _______ _______         '"\033[0m"
echo "\033[0;32m"'/ ___   |  ___  |  ____ \\     /|'"\033[0m"
echo "\033[0;32m"'\/   )  | (   ) | (    \( \   / )'"\033[0m"
echo "\033[0;32m"'    /   ) |   | | (__    \ (_) / '"\033[0m"
echo "\033[0;32m"'   /   /| |   | |  __)    \   /  '"\033[0m"
echo "\033[0;32m"'  /   / | |   | | (        ) (   '"\033[0m"
echo "\033[0;32m"' /   (_/\ (___) | (____/\  | |   '"\033[0m"
echo "\033[0;32m"'(_______(_______|_______/  \_/   '"\033[0m"

echo "\n\n \033[0;32m....is now installed.\033[0m"
