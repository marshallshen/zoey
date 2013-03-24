# Zoey: todo list for Rubyists
Introduce Zoey, a small todo command tool for Rubyists.

##Setup

###Via `curl`
```
curl -L curl -L https://raw.github.com/marshallshen/zoey/master/config/install.sh | sh
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
chmod +x ~/.zoey/lib/zoey.rb
```
After the set up, paste the follow to the bash file of your choice (.bashrc, .zshrc, etc)
```
alias zoey="~/./.zoey/lib/zoey.rb"
```

##Usage
Inside your terminal, you add ask for help!
```
> zoey help

Usage: todo [options] COMMAND

Commands:
  add TODO             Adds a todo
  check NUM            Removes a todo
  list ls [CONTEXT]    Lists all active todos
```

Manage your todo list
```
> zoey add write a blog post
Added: write a blog post: @next

> zoey add work out at 6 @health
Added: work out at 6: @health

> zoey add hang out with Marshall and Lily @routine
> Added: hang out with Marshall and Lily: @routine

> zoey ls
1: write a blog post                    @next
2: work out at 6                        @health
3: hang out with Marshall and Lily      @routine

> zoey check 1
Check: write a blog post: @done
```

Advanced management of todos
```
> zoey ls @health
1: work out at 6      @health
```
