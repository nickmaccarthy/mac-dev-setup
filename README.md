# Mac Development Setup

This is my automated setup for most of the software I use on my Mac for development.  The purpose of this is to keep an ongoing list of what I am using in my environment and to have an automated way to rebuild it in case I ever need to.  If you find the software list below useful, then please use this as it could save you a few hours vs doing it manually yourself.  It is also customizable with its own configuration if you want to modify which software/programs get installed on your machine as well. 

## Installation

1. ensure you have `python3` and `pip` installed.  You typically do if you have a late-ish MacOS ( El Capitan and above ).
2. Create a virtual environment and install ansible in it - for this example, lets just create the virtualenv in our `$HOME`

```bash
python3 -m venv ~/venvs/mac_ansible
source ~/venvs/mac_ansible/bin/activate
pip3 install ansible
```

3. Run the playbook

```bash
ansible-playbook playbook.yml --ask-become-pass

```

4. Provide the sudo passwords when it asks
5. ...
6. Profit



## Included Applications / Configurations:

Applications (installed with Homebrew Cask):

  - [Visual Studio Code](https://code.visualstudio.com/)
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
  - htop
  - nmap
  - sqlite
  - go
  - node

Dotfiles:

It installs all the dotfiles from my [dotfiles](https://github.com/nickmaccarthy/dotfiles) repo.  If you have your own dotfiles you want to use instead, simply set your `dotfiles_items` and or your own `dotfiles_repo` in a `custom.config.yml` and this will take care of that for you.   

## Overriding Default Application / Programs

You may want to customize which applications and or programs that get installed through Brew / Cask / Pip etc.  Its easy to do, simply create a file called `custom.config.yml` (included in this repo) and place it in the root of this directory (same directory that `playbook.yml` and this `README` is in), and then add your own items.

Example `custom.config.yml`:

```yaml
# Install my .dotfiles from my repo here: https://github.com/nickmaccarthy/dotfiles
dotfiles_install: True

# Set the default shell to bash.  On recent version of OSX, this has been zsh.  I typically do all my scripting in bash, so I am overwriting here.
default_shell: bash

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

```

## Adding additional Applications / Programs

If you are satisfied with the default application/program list, but want to add a few more items, you can do so by adding you items to the `additional` item lists

Example:

```yaml
additional_brew_cask_items:
  - visual-studio-code
```


## Changelog

* `2021-07-03` - Fixed various bugs and added support for M series macs, set default shell to zsh and added ohmyzsh!
* `2021-03-02` - Added tags as well as kubectl, helm and kops
* `2021-02-18` - Getting things to work with python3 and later version of OSX like Catalina and Big Sur.  
* `2018-11-20` - Added support for Ansible 2.4+.  Added `custom.config.yml` to main repo.  Modified `runit.sh` to add tests.  
* `2017-07-19` - Added support for consolas font installation, checkout `tasks/consolas.yml` for more details

## Author

[Nick MacCarthy](http://nickmaccarthy.com), 2016.  Inspired by the mac setup of [Jeff Geerling](https://github.com/geerlingguy/mac-dev-playbook)
