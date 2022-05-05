# Code Snippets for Ruby, Rails, Gems
## Command-T Ruby
### If Command-T breaks with PlugUpdate
Add to .zshrc if not present already: `export PATH="/usr/local/opt/ruby/bin/:$PATH"`
Then run:
```
source ~/.zshrc
cd ~/.vim/plugged/command-t/ruby/command-t/ext/command-t
make clean
/usr/local/opt/ruby/bin/ruby extconf.rb
make
```
