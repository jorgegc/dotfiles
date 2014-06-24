# Jorge's dotfiles

## Instalation

### Prerequisites

* Git (1.8+ recommended)

Optional, but recommended:

* [drush](https://github.com/drush-ops/drush)

### Bootstrapper

The bootstrapper will back up all your existing files before it installs
anything new, it'll also warn you if a dependency isn't met.

``` bash-session
$ bash < <( curl https://raw.githubusercontent.com/jorgegc/dotfiles/master/bootstrap.sh )
```

Don't worry, all your old files will be backed up!

### Stay Updated

Run the bootstrapper again!

``` bash-session
$ ~/.dotfiles/scripts/bootstrap.sh
```

## Configuration

### Changes to the `$PATH`

If `~/.path` exists, it will be sourced along with the other files. You can use this to change the `$PATH` without the need to fork this entire repository.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash-session
export PATH="$HOME/utils:$PATH"
```

### Extra configuration

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` at work looks something like this:

```bash-shell
# Make sure I use the work email address when committing to Git.
GIT_AUTHOR_NAME="Jorge Castro"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jorge@mywork.email"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It's probably better to [fork this repository](https://github.com/jorgegc/dotfiles/fork) instead, though.

## Files

### Shell

Most of the shell junk is setup to work in both zsh and bash. Bash users should
see [.bash_profile](https://github.com/jorgegc/dotfiles/blob/master/.bash_profile)
and [.bash_prompt](https://github.com/jorgegc/dotfiles/blob/master/.bash_prompt).

### Aliases

Check out [.aliases](https://github.com/jorgegc/dotfiles/blob/master/.aliases) and [.drush_bashrc](https://github.com/jorgegc/dotfiles/blob/master/.drush_bashrc)

### Sensible configurations

* RubyGems ([.gemrc](https://github.com/jorgegc/dotfiles/blob/master/.gemrc))
* Git ([.gitattributes](https://github.com/jorgegc/dotfiles/blob/master/.gitattributes) and [.gitconfig](https://github.com/jorgegc/dotfiles/blob/master/.gitconfig))
