My dotfiles
===========

These are intended to be installed as a
[homeshick](https://github.com/andsens/homeshick) castle, formerly a
[homesick](https://github.com/technicalpickles/homesick) castle.


Setup
-----
This config expects a `~/.passwords` file, with secret env variables like so:

    export redshift_username=my_username
    export redshift_password=my_password


When porting to a new laptop neovim will need to reinstall its packages. Do this with `:PlugInstall`.
