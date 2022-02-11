
# Setting up our Neovim installation.
This writeup will expect that you have `git` already installed and configured with `ssh` on your system.

## Windows
Let's start by installing `scoop`; one of the multiple package managers for Windows. Visit the website [here](https://scoop.sh) and just follow the instructions. Once it's installed you can install `Neovim` by opening an administrator elevated command prompt and using the following command: `scoop install neovim`.

Once it's fully installed, you can follow it up in the same command prompt with the following commands:
```batch
setx /M XDG_CONFIG_HOME "%USERPROFILE%\.config
cd %USERPROFILE%
git clone git@github.com:sammynilla/win-dotfiles.git
move win-dotfiles .config
```

Our editor should be all setup now utilizing our Windows configuration files. Enjoy!
