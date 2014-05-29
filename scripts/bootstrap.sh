#!/bin/bash

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------

# Notice title.
notice() { echo -e "\033[1;32m=> $1\033[0m"; }

# Error title.
error() { echo -e "\033[1;31m=> Error: $1\033[0m"; }

# List item.
c_list() { echo -e "  \033[1;32m✔\033[0m $1"; }

# Error list item.
e_list() { echo -e "  \033[1;31m✖\033[0m $1"; }

# Check for dependency.
dep() {
  type -p $1 &> /dev/null
  local installed=$?
  if [ $installed -eq 0 ]; then
    c_list $1
  else
    e_list $1
  fi
  return $installed
}

# Backup dot files.
backup() {
  mkdir -p $backupdir

  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}"
    should_backup=$?
    if [ $should_backup -gt 0 ]; then
      if [ -d "$HOME/$file" ] || [ -f "$HOME/$file" ]; then
        cp -Rf "$HOME/$file" "$backupdir/$file"
      fi
    fi
  done
}

# Install dot files.
install() {
  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}"
    should_install=$?
    if [ $should_install -gt 0 ]; then
      [ -d "$HOME/$file" ] && rm -rf "$HOME/$file"
      cp -Rf "$file" "$HOME/$file"
    fi
  done
}

# Check if a value exists in an array.
in_array() {
  local hay needle=$1
  shift
  for hay; do
    [[ $hay == $needle ]] && return 0
  done
  return 1
}


#-----------------------------------------------------------------------------
# Initialize
#-----------------------------------------------------------------------------

backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d%H%M%S")"
dependencies=(git)
excluded=(. .. .git .gitignore bootstrap.sh README.md init scripts)


#-----------------------------------------------------------------------------
# Dependencies
#-----------------------------------------------------------------------------

notice "Checking dependencies"

not_met=0
for need in "${dependencies[@]}"; do
  dep $need
  met=$?
  not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
  error "$not_met dependencies not met!"
  exit 1
fi


#-----------------------------------------------------------------------------
# Install
#-----------------------------------------------------------------------------

# Assumes $HOME/.dotfiles is ours.
if [ -d $HOME/.dotfiles ]; then
  pushd $HOME/.dotfiles

  # Update Repo.
  notice "Updating"
  git pull origin master

  # Backup.
  notice "Backing up old files to: $backupdir"
  backup

  # Install.
  notice "Installing"
  install
else
  # Clone Repo.
  notice "Downloading"
  git clone git://github.com/jorgegc/dotfiles.git $HOME/.dotfiles

  pushd $HOME/.dotfiles

  # Backup
  notice "Backing up old files: $backupdir"
  backup

  # Install
  notice "Installing"
  install
fi


#-----------------------------------------------------------------------------
# Finished
#-----------------------------------------------------------------------------

popd
notice "Done"
exec $SHELL -l
