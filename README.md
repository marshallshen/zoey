# Zoey: todo list for Rubyists
Introduce Zoey, a small todo command tool for Rubyists.
##Setup

###Via `curl`
```
curl -L https://github.com/marshallshen/zoey/config/install.sh | sh
```

After the set up, paste the follow to the bash file of your choice (.bashrc, .zshrc, etc)
```
alias zoey="~/./.zoey/lib/zoey.rb"
```
##Manual Install
```
git clone git://github.com/marshallshen/zoey.git ~/.zoey
```
You need to grant execution for the file:
```
chmod +x ./zoey/lib/zoey.rb
```
After the set up, paste the follow to the bash file of your choice (.bashrc, .zshrc, etc)
```
alias zoey="~/./.zoey/lib/zoey.rb"
```
