# Mac Development Setup

This is my automated setup for most of the software I use on my Mac for development.  The purpose of this is to keep an ongoing list of what I am using in my environment and to have an automated way to rebuild it in case I ever need to.  If you find the software list below useful, then please use this as it could save you a few hours vs doing it manually yourself.  It is also customizable with its own configuration if you want to modify which software/programs get installed on your machine as well.  While Ansible does alot of the heavy lifting, it is meant to be ran with a shell script wrapper which will install pip first, and then Ansible, and then runs our playbook from there.  

## Installation
1. ensure you have `python` and `easy_install` installed.  You typically do if you have a late-ish MacOS ( El Capitan and above ).
2. From your terminal, run the shell script `./runit.sh`
3. Provide the sudo passwords when it asks
4. ...
5. Profit

### Running just ansible
If you want to run just ansible by its self, from this directory simply run.
```
ansible-playbook playbook.yml -vv --ask-sudo-pass
```

## Included Applications / Configurations:

Applications (installed with Homebrew Cask):

  - [Atom](https://atom.io)
  - [Docker](https://www.docker.com/)
  - [Dropbox](https://www.dropbox.com/)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - [Google Chrome](https://www.google.com/chrome/)
  - [Homebrew](http://brew.sh/)
  - [Sequel Pro](https://www.sequelpro.com/) (MySQL client)
  - [Skitch](https://evernote.com/skitch/)
  - [Slack](https://slack.com/)
  - [Sublime Text](https://www.sublimetext.com/)
  - [Transmit](https://panic.com/transmit/) (S/FTP client)
  - [Vagrant](https://www.vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  - [Spotify](https://www.spotify.com)
  - [Alfred](https://www.alfredapp.com/)
  - [iterm2](https://www.iterm2.com/)

Programs (installed with Homebrew):
  - vim
  - git
  - wget
  - nmap
  - sqlite
  - go
  - node

Dotfiles:

It installs all the dotfiles from my [dotfiles](https://github.com/nickmaccarthy/dotfiles) repo.  If you have your own dotfiles you want to use instead, simply set your `dotfiles_items` and or your own `dotfiles_repo` in a `custom.config.yml` and this will take care of that for you.   

## Overriding Default Application / Programs

You may want to customize which applications and or programs that get installed through Brew / Cask / Pip etc.  Its easy to do, simply create a file called `custom.config.yml` and place it in the root of this directory (same directory that `playbook.yml` and this `README` is in), and then add your own items.

Example `custom.config.yml`:
```
dotfiles_install: False

brew_base_items:
  - openssl
  - vim
  - git
  - wget
  - node

brew_cask_items:
  - docker
  - iterm2
  - vagrant
  - virtualbox

pip_items:
  - virtualenv

pathogen_plugins:
  - repo: "https://github.com/kevinw/pyflakes-vim.git"

```

## Author
[Nick MacCarthy](http://nickmaccarthy.com), 2016.  Inspired by the mac setup of [Jeff Geerling](https://github.com/geerlingguy/mac-dev-playbook)
