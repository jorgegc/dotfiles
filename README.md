# Jorge's dotfiles

If you are a [Drupal](http://drupal.org/) developer you will probably find something interesting in my dotfiles.

They don't have much in them but they have just enough to get me going whenever I need to work in different
environments.

![Screenshot of Jorge's terminal](http://i.imgur.com/JMagLIX.png)

## Instalation

### Prerequisites

* Git (2.x recommended)

Optional, but recommended:

* [drush](https://github.com/drush-ops/drush) - A command line shell and scripting interface for Drupal.

### Bootstrapper

The bootstrapper will back up all your existing files before it installs
anything new. It'll also warn you if a dependency isn't met.

``` bash-session
$ bash <(curl -fsSL https://raw.githubusercontent.com/jorgegc/dotfiles/master/scripts/bootstrap.sh)
```

Don't worry, all your old files will be backed up in `~/.dotfiles-backup`.

## Upgrading

Upgrading is easy, all you need to do is run the bootstrapper again.

``` bash-session
$ ~/.dotfiles/scripts/bootstrap.sh
```

## Extending

### Changes to the `$PATH`

If `~/.dotfiles/.path` exists, it will be sourced along with the other files. You can use this to change the `$PATH`
without having to fork this entire repository.

Here’s an example `~/.dotfiles/.path` file that adds `~/utils` to the `$PATH`:

```bash-session
export PATH="$HOME/utils:$PATH"
```

### Extra configuration

Same as the `.path`, if `~/.dotfiles/.extra` exists, it will be sourced along with the other files. You can use this to
add a few custom commands without having to fork this entire repository or to add commands you don’t want to commit to a
public repository.

My `~/.dotfiles/.extra` at work looks something like this:

```bash-shell
# Make sure I use the work email address when committing to Git.
GIT_AUTHOR_NAME="Jorge Castro"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jorge@mywork.email"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.dotfiles/.extra` to override settings, functions and aliases from my dotfiles repository.
However, it would probably better to [fork this repository](https://github.com/jorgegc/dotfiles/fork) instead.

## What is included

### Shell

Most of the shell junk is setup to work in both zsh and bash. Bash users should
see [.bash_profile](https://github.com/jorgegc/dotfiles/blob/master/.bash_profile)
and [.bash_prompt](https://github.com/jorgegc/dotfiles/blob/master/.bash_prompt).

### Aliases

Check out [.aliases](https://github.com/jorgegc/dotfiles/blob/master/.aliases)

### Sensible configurations

* RubyGems ([.gemrc](https://github.com/jorgegc/dotfiles/blob/master/.gemrc))
* Git [.gitconfig](https://github.com/jorgegc/dotfiles/blob/master/.gitconfig))
