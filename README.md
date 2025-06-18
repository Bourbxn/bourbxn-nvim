<h1 align="center">BourbxnNvim</h1>

<div align="center">
	<a href="#showcase">Showcase</a>
  <span> • </span>
    	<a href="#plugins-list">Plugins List</a>
   <span> • </span>
	<a href="#install">Install</a>
   <span> • </span>
	<a href="#configure">Configure</a>
   <span> • </span>
	<a href="#keymaps">Keymaps</a>
     <span> • </span>
	<a href="#contributors">Contributors</a>
  <p></p>
</div> 

**NOTICE** : This is a first version of my neovim configuration. You can install my neovim configuration and install other plugin or edit
my configuration as much as you want. My neovim is the refference to newer neovim user. Vim is better na kub.

## Showcase
<img width="1440" alt="Screenshot 2566-02-28 at 15 00 45" src="https://user-images.githubusercontent.com/86193685/221790969-c2dd1ca8-5044-4690-b5f9-fd0c70794d62.png">
<img width="1440" alt="Screenshot 2566-02-28 at 14 55 56" src="https://user-images.githubusercontent.com/86193685/221791083-2cdbf058-5c29-4119-bf8d-ee3537d0e992.png">
<img width="1440" alt="Screenshot 2566-02-28 at 14 55 36" src="https://user-images.githubusercontent.com/86193685/221791138-dfbf6048-df5a-4b73-ae4e-f34658eea231.png">
<img width="1440" alt="Screenshot 2566-02-28 at 15 01 58" src="https://user-images.githubusercontent.com/86193685/221791172-fef135b0-0e44-4d7d-b8b2-0ed795a0deb5.png">
<br>

## Plugins List
- Beautiful and minimal theme by [tokyonight](https://github.com/folke/tokyonight.nvim)
- Starts dashboard with [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- File explorer tree with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- Top bar file navigation with [barbar](https://github.com/romgrk/barbar.nvim)
- Buttom status bar with [lualine](https://github.com/nvim-lualine/lualine.nvim)
- Fuzzy file finder with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Toggle terminal with [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- File icons with [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Auto syntax completion with [LuaSnip](https://github.com/L3MON4D3/LuaSnip), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- Language servers for formatters and linters with [mason](https://github.com/williamboman/mason.nvim), [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) and other
- Auto closing tag for HTML with [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- Auto rename tag for HTML [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- Easy way to commenting with [Comment](https://github.com/numToStr/Comment.nvim)
- Indent tab blankline with [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- Color highlighting with [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
- and other
<br>

## Install

#### 1. Install Neovim
MacOS/Linux
```bash
brew install neovim
```
Windows
```bash
scoop install neovim
```

#### 2. Install BourbxnVim
MacOS/Linux
```bash
git clone https://github.com/Bourbxn/bourbxn-nvim.git ~/.config/nvim
```
Windows
```bash
git clone https://github.com/Bourbxn/bourbxn-nvim.git $HOME\AppData\Local\nvim
```

## Uninstall
MacOS/Linux
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```
Windows
```bash
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```
<br>

## Configure

### Add Plugins
Collections of neovim plugins at [neovimcraft](https://neovimcraft.com/)
1. Open and edit ```plugins-setup.lua``` in ```nvim/lua/bourbxn/plugins/plugins-setup.lua```
2. Add ```use("<plugin-repository>")```
```bash
return require("packer").startup(function(use)
	...
	use("<plugin-repository>")
	...
	use(
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
```
3. Save and It will install plugin by itself.
4. Mostly plugins can configure and you can configure that by go to directory ```nvim/lua/bourbxn/plugins/plugins-conf```
5. Create new file configuration ```touch <config-filename>.lua``` and add configuration in this file
6. Open and edit ```init.lua``` in ```nvim/lua/bourbxn/plugins/plugins-conf/init.lua``` then add
```bash
require("bourbxn.plugins.plugins-conf.<config-filename>")
```

### Remove Plugins
1. Open and edit ```plugins-setup.lua``` in ```nvim/lua/bourbxn/plugins/plugins-setup.lua```
2. Delete ```use("<plugin-repository>")``` and save
3. If this plugin have configuration file you must remove configuration file in ```nvim/lua/bourbxn/plugins/plugins-conf/``` and delete require in ```init.lua``` in ```nvim/lua/bourbxn/plugins/plugins-conf/init.lua```

### Configure Keymaps
Configure keymaps at ```keymaps.lua``` in ```nvim/lua/bourbxn/core/keymaps.lua```
#### Configure Mapleader
Mapleader is a first key to start using keymaps. Keymaps should use mapleader because keymaps shortkey will not cover default vim shortkey.
Normally neovim user used spacebar as mapleader.
```bash
vim.g.mapleader = "<mapleader>"
```

#### Configure Keymaps
```[mode]``` has 3 modes normal mode```n```, insert mode```i``` and visual mode```v``` <br>
```[keys]``` can add many keys on keyboard ex. ```"<leader>ee"``` <br>
```[command]``` can add neovim command ex. ```"<cmd>NvimTreeToggle<cr>"``` <br>
```bash
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { buffer = 0 }
...
keymap.set("[mode]", "<leader>[keys]", "<cmd>[command]<cr>")
```


<br>

## Sample Keymaps

### Normal Mode

| Mappings        | Action                                               |
|-----------------|------------------------------------------------------|
| `<spacebar>sv`  | split window horizontally                            |
| `<spacebar>sh`  | split window horizontally                            |
| `<spacebar>se`  | make split windows equal width and height            |
| `<spacebar>sx`  | close current split window     		         |
| `<spacebar>nh`  | clear search highlights                              |
| `<spacebar>ee`  | toggle explorer tree                                 |
| `<spacebar>ef`  | focus explorer tree                                  |
| `<spacebar>ff`  | toggle fuzzy finder                                  |
| `<spacebar>hh`  | move to left tab in top navigation                   |
| `<spacebar>ll`  | move to right tab in top navigation                  |
| `<spacebar>gg`  | move to last tab in top navigation                   |
| `<spacebar>g<n>`| move to tab n(1-9) in top navigation                 |
| `<spacebar>cc`  | close current tab in top navigation                  |
| `<spacebar>tt`  | toggle terminal                                      |


### Insert Mode
| Mappings        | Action                                               |
|-----------------|------------------------------------------------------|
| `<spacebar>jk`  | switch to normal mode                                |


### Visual Mode
| Mappings        | Action                                               |
|-----------------|------------------------------------------------------|
| `J`             | move all line that selected down                     |
| `K`             | move all line that selected up                       |


Configure your own at ```keymaps.lua``` in ```nvim/lua/bourbxn/core/keymaps.lua```<br>
How to configure? 
<a href="#configure-keymaps">Click here</a>
<br>
<br>

## Contributors

<div>
<span>
<a href="https://github.com/Bourbxn">
 <img src="https://images.weserv.nl/?url=avatars.githubusercontent.com/u/86193685?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d"/>
</a>
</span>
&nbsp;
<span>
<a href="https://github.com/arn355">
 <img src="https://images.weserv.nl/?url=avatars.githubusercontent.com/u/86312780?v=4&h=80&w=80&fit=cover&mask=circle&maxage=7d"/>
</a>
</span>
</div>

