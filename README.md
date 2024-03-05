<img style="display: grid;width: 200px; justify-content: center;" src="./docs/assets/termNvim.png"/>

<h1 style="text-align: center;"><span style="font-weight: 100">Term</span><span style="font-weight: 600">Nvim</span></h1>
<p style="text-align: center;">
<I style="font-size: 0.75rem; font-weight: 200">"Made on mobile, for mobile"</i></p>

<p style="text-align: center">Highly Customised <span style="font-weight: 100">Neo</span><span style="font-weight: 700">Vim</span> setup to be used inside <i style="font-weight: 700">Termux</i> for Web Development</p>

# Features
- ⌨️ Sensible keymaps that are mobile-friendly.
- 🌪️ Animated statusline with a bunch of pre-configured ones and guides on how to make your own.
- 🏝️ Custom start-up screen with recent files history and helper functions for making your own ones.
- 🔭 Telescope with a few useful plugins for making browsing an ease.
- 🌐 LSP setup for `web development` with multiple completion sources and completion menu setup.
- 📦 UI improvements to make usage much easier.
- 🌀 Smooth scroll
And much more!

# Setup
If you had a previous `Neovim` configuration you must run these commands first

```
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

Run the following commands

```
cd ~/.config && ls
mv nvim nvim.bak
mkdir nvim && cd nvim
git clone https://www.github.com/OXY2DEV/nvim
```
<p style="font-size: 0.4rem;">You can also just run the entire thing as a single command.</p>

Afterwards, run `Neovim` like normal. You may need to do `:UpdateRemotePlugins` inside `Neovim` to get `Treesitter` working.

# Getting started
There are a few `keymaps` you have to familiarise for using this.

All of this `keymaps` are for `normal` mode as it makes the most sense on a smartphone 📱
- `Space w` saves the file you are editing.
- `Space q` quits `nvim`.
- `Space wq` saves and quit.
- `Space qq` quit and don't save.

- `Space f` opens `Telescope file_browser`.
- `Space u` opens an `undo` history.
- `Space .` goes to the next tab.
- `Space ,` goes to the previous tab.

<p style="font-size: 0.4rem"><b>space</b> is the leader key. You can change it by changing <b>vim.g.mapleader</b></p>

Touch controls also work so you can use them too.

If you forget about them you can just press `space` and wait for a bit. `Which-key` should pop-up and show you all the keymaps.

# File structure
The file structure is as follows
```
nvim
╰─ init.lua
   ├─ settings.lua
   ├─ keymaps.lua
   ╰─ plugins.lua
      ╰─ plugin_name.lua
```

This is done so that all the settings and keymaps still work even if you mess up the plugins setup(trust me it's a very common thing).

All the plugins are in `plugins.lua` while their configuration files are inside the `plugins` folder.

# Help
For any `file_name.lua` there is a `file_name.md` inside the `docs` to help you out if you are stuck.

If that doesn't help you can open an issue here(you must provide sufficient information about the issue or I can't fix them).
