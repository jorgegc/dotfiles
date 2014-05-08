# Add bin and sbin to $PATH.
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Common junk.
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
