<img src="./TNVIM.png" alt="hi" />

<p style="text-align: center; font-size: 1.5rem">Term<b>Nvim</b></p>
<p style="text-align: center;font-size: 0.5rem;">Created on Mobile, Created for Mobile</p>

> ⚙️ About
> A customised **Neovim** setup for **Termux**

## Introduction
> 🧱 The problem
> 
> Most of the **Neovim** distros currently available are catered for PCs with **Horizontal** displays. However, due to this the experience of using them in **Termux** is less then ideal.

As such I created this, I wanted a configuration that was easy to understand and maintain, was plug-and-play and taught new users how to create their own **configurations**.

> 🎯 The target 
> 
> This is meant for people who want to learn **programming** or **Neovim** in general, but don't have access to a computer.

While apps like **Spck**, **Acode** and others exist. I found that most of them don't provide a *complete* development environment and tend to take up a lot of spaces too. 
They also don't provide that much of customisation which was why I picked **Neovim** in the first place.

> ❌ What this isn't

This is *NOT* meant to be a replacement for any of the current distros. I saw that most of the distros available usually take around an **Hour** just to understand how to set them up. And still you may not be able to customise it to your own preferences.

It is also *NOT* meant to be the best setup for **Neovim** on **Termux**. I am not an expert in **Neovim**, however I have went through the learning process and want to make the process as smooth as possible for others.

> ⚠️ Alpha stage
> 
> I am fairly new to **Neovim** myself. As such this project is in it's **Alpha** stage. You may find bugs here and there, but it should be more than stable enough to be used as a daily driver. Also expect massive **changes** in the future.

> 🧭 Previous part
> 
> You should definitely first check my `termux` repo to learn the basics of using the terminal and how to set everything up.

## Installation
### Requirements
1. Ensure `neovim` is installed. You can check it with this command 
```bash
nvim --version
```
> If it's not installed you can run the following command to install it

```bash
pkg install neovim
```
2. You may want to install the `nodejs` client for `neovim`. You can do this with the following command if you haven't already.
```bash
pkg install nodejs-lts
```
3. Others

### On a fresh `Termux` installation
You should follow these instructions if you have just installed `Termux`.
1. Update & upgrade old packages so that you don't get errors when running things.
```bash
pkg upgrade && pkg update
```
2. Install `neovim` & `git`.
```shell
pkg install neovim git
```
3. Clone this repository into the `~/.config/nvim/` folder/directory.
```bash
git clone https://www.github.com/OXY2DEV/termNvim ~/.config/nvim/
```

> 🧭 Optional 
> 
> You should also setup `termux-storage` if you want to access your phones internal storage.
### With a previous Neovim configuration
If you already have experience in `Neovim` follow these steps instead.
1. First let's back up your old files so you can restore your old configuration anytime you want.
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```
2. Now, we should get rid of the old files stored in the `~/.local/share/nvim/` & `~/.local/state/nvim/` directory to prevent any errors from occuring during the setup.
```bash
rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim
```
3. Now we clone the repo.
```bash
git clone https://www.github.com/OXY2DEV/termNvim ~/.config/nvim/
```
