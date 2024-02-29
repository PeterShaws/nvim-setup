# My Neovim Setup

<!-- mtoc-start -->

* [Installation](#installation)
* [Dependencies](#dependencies)
* [GUI (Optional)](#gui-optional)
* [Plugins used](#plugins-used)
* [Colorschemes installed](#colorschemes-installed)
* [Keymaps](#keymaps)
  * [General Keymaps](#general-keymaps)
    * [Insert mode navigation](#insert-mode-navigation)
    * [Window navigation](#window-navigation)
    * [Files/Buffers](#filesbuffers)
    * [Text](#text)
  * [Plugin keymaps](#plugin-keymaps)
    * [`alpha` (Dashboard)](#alpha-dashboard)
    * [`better-escape` (escape insert mode)](#better-escape-escape-insert-mode)
    * [`boole` (manipulate numbers and booleans)](#boole-manipulate-numbers-and-booleans)
    * [`bufferline` and `bufdelete` (buffer tabs)](#bufferline-and-bufdelete-buffer-tabs)
    * [`nvim-cmp` (autocompletion)](#nvim-cmp-autocompletion)
    * [`floaterm` (floating terminal)](#floaterm-floating-terminal)
    * [`huez` (colorscheme picker)](#huez-colorscheme-picker)
    * [`gitsigns` (Git integration)](#gitsigns-git-integration)
    * [`lazygit` (Git client)](#lazygit-git-client)
    * [`leap` (document navigation)](#leap-document-navigation)
    * [`nvim-lspconfig` (language server)](#nvim-lspconfig-language-server)
    * [`neo-tree` (file explorer)](#neo-tree-file-explorer)
    * [`surround` (wrap text with pairs of characters)](#surround-wrap-text-with-pairs-of-characters)
    * [`telescope` (find things)](#telescope-find-things)
    * [`todo-comments` (to-do tags in comments)](#todo-comments-to-do-tags-in-comments)
    * [`trouble` (diagnostics)](#trouble-diagnostics)

<!-- mtoc-end -->

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/PeterShaws/nvim-setup.git ~/.config/nvim
   ```

2. `cd` into `~/.config/nvim`;
3. Launch Neovim (`nvim`) and wait for Lazy's UI to appear, then wait for it to
   sync all plugins;
4. You should be good to go; if not, relaunch Neovim.

## Dependencies

1. `nodejs`/`npm`, to download LSPs, formatters, etc.;
2. `rg`, for fuzzy finding;
3. `fd`, for finding files;
4. `lazygit`, for interacting with Git;
5. `ydiff`, a pager that can show diffs side-by-side (optional).

   > `~/.config/lazygit/config.yml`

   ```yaml
   gui:
     nerdFontsVersion: 3
     sidePanelWidth: 0.2
     theme:
       selectedLineBgColor:
         - "#444444"
   git:
     paging:
       colorArg: never
       pager: ydiff -p cat -s --wrap --width={{columnWidth}}
   os:
     editPreset: "nvim"
   ```

## GUI (Optional)

Use [Neovide](https://neovide.dev) as a GUI for Neovim.

> `~/.config/neovide/config.toml`

```toml
[font]
normal = { "family" = "JetBrainsMono Nerd Font", "style" = "Light" }
bold = { "family" = "JetBrainsMono Nerd Font", "style" = "SemiBold" }
italic = { "family" = "JetBrainsMono Nerd Font", "style" = "Light Italic" }
bold_italic = { "family" = "JetBrainsMono Nerd Font", "style" = "SemiBold Italic" }
size = 16
hinting = "none"
edging = "subpixelantialias"

[font.features]
"JetBrainsMono Nerd Font" = ["+zero"]
```

This Neovim setup has keymaps for copying/pasting in Neovide while in terminal
mode (useful e.g. for LazyGit).

## Plugins used

* [`akinsho/bufferline.nvim`](https://github.com/akinsho/bufferline.nvim)
* [`brenoprata10/nvim-highlight-colors`](https://github.com/brenoprata10/nvim-highlight-colors)
* [`davidmh/cspell.nvim`](https://github.com/davidmh/cspell.nvim)
* [`famiu/bufdelete.nvim`](https://github.com/famiu/bufdelete.nvim)
* [`folke/lsp-colors.nvim`](https://github.com/folke/lsp-colors.nvim)
* [`folke/neodev.nvim`](https://github.com/folke/neodev.nvim)
* [`folke/noice.nvim`](https://github.com/folke/noice.nvim)
* [`folke/todo-comments.nvim`](https://github.com/folke/todo-comments.nvim)
* [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim)
* [`folke/which-key.nvim`](https://github.com/folke/which-key.nvim)
* [`ggandor/leap.nvim`](https://github.com/ggandor/leap.nvim)
* [`goolord/alpha-nvim`](https://github.com/goolord/alpha-nvim)
* [`hedyhli/markdown-toc.nvim`](https://github.com/hedyhli/markdown-toc.nvim)
* [`hrsh7th/cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp)
* [`hrsh7th/cmp-path`](https://github.com/hrsh7th/cmp-path)
* [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)
* [`kdheepak/lazygit.nvim`](https://github.com/kdheepak/lazygit.nvim)
* [`L3MON4D3/LuaSnip`](https://github.com/L3MON4D3/LuaSnip)
* [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)
* [`max397574/better-escape.nvim`](https://github.com/max397574/better-escape.nvim)
* [`MunifTanjim/nui.nvim`](https://github.com/MunifTanjim/nui.nvim)
* [`nat-418/boole.nvim`](https://github.com/nat-418/boole.nvim)
* [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
* [`numToStr/Comment.nvim`](https://github.com/numToStr/Comment.nvim)
* [`nvim-lua/plenary.nvim`](https://github.com/nvim-lua/plenary.nvim)
* [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim)
* [`nvim-neo-tree/neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim)
* [`nvim-telescope/telescope-ui-select.nvim`](https://github.com/nvim-telescope/telescope-ui-select.nvim)
* [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)
* [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)
* [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
* [`nvim-treesitter/nvim-treesitter-textobjects`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
* [`nvimtools/none-ls.nvim`](https://github.com/nvimtools/none-ls.nvim)
* [`rafamadriz/friendly-snippets`](https://github.com/rafamadriz/friendly-snippets)
* [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify)
* [`s1n7ax/nvim-window-picker`](https://github.com/s1n7ax/nvim-window-picker)
* [`saadparwaiz1/cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip)
* [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive)
* [`tpope/vim-surround`](https://github.com/tpope/vim-surround)
* [`vague2k/huez.nvim`](https://github.com/vague2k/huez.nvim)
* [`voldikss/vim-floaterm`](https://github.com/voldikss/vim-floaterm)
* [`williamboman/mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim)
* [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim)
* [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs)

## Colorschemes installed

* [`AlexvZyl/nordic.nvim`](https://github.com/AlexvZyl/nordic.nvim)
* [`atelierbram/Base2Tone-nvim`](https://github.com/atelierbram/Base2Tone-nvim)
* [`catppuccin/nvim`](https://github.com/catppuccin/nvim)
* [`cocopon/iceberg.vim`](https://github.com/cocopon/iceberg.vim)
* [`deparr/tairiki.nvim`](https://github.com/deparr/tairiki.nvim)
* [`EdenEast/nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
* [`ellisonleao/gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim)
* [`folke/tokyonight.nvim`](https://github.com/folke/tokyonight.nvim)
* [`gmr458/vscode_modern_theme.nvim`](https://github.com/gmr458/vscode_modern_theme.nvim)
* [`jacoborus/tender.vim`](https://github.com/jacoborus/tender.vim)
* [`kepano/flexoki-neovim`](https://github.com/kepano/flexoki-neovim)
* [`liuchengxu/space-vim-dark`](https://github.com/liuchengxu/space-vim-dark)
* [`loctvl842/monokai-pro.nvim`](https://github.com/loctvl842/monokai-pro.nvim)
* [`lunarvim/horizon.nvim`](https://github.com/lunarvim/horizon.nvim)
* [`Mofiqul/vscode.nvim`](https://github.com/Mofiqul/vscode.nvim)
* [`neanias/everforest-nvim`](https://github.com/neanias/everforest-nvim)
* [`NLKNguyen/papercolor-theme`](https://github.com/NLKNguyen/papercolor-theme)
* [`olimorris/onedarkpro.nvim`](https://github.com/olimorris/onedarkpro.nvim)
* [`patstockwell/vim-monokai-tasty`](https://github.com/patstockwell/vim-monokai-tasty)
* [`projekt0n/github-nvim-theme`](https://github.com/projekt0n/github-nvim-theme)
* [`rebelot/kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim)
* [`rose-pine/neovim`](https://github.com/rose-pine/neovim)
* [`sainnhe/sonokai`](https://github.com/sainnhe/sonokai)
* [`savq/melange-nvim`](https://github.com/savq/melange-nvim)
* [`Shatur/neovim-ayu`](https://github.com/Shatur/neovim-ayu)

## Keymaps

> Note: Most if not all of these should be covered by the `which-key` plugin.

> Note: In the tables below, `Leader` means `Space` with this configuration.

### General Keymaps

#### Insert mode navigation

| Modes |   Keys    | Description       |
| :---: | :-------: | ----------------- |
|   i   | `Alt`+`h` | Move cursor left  |
|   i   | `Alt`+`j` | Move cursor down  |
|   i   | `Alt`+`k` | Move cursor up    |
|   i   | `Alt`+`l` | Move cursor right |

#### Window navigation

| Modes |        Keys        | Description                  |
| :---: | :----------------: | ---------------------------- |
|   n   |     `Ctrl`+`c`     | Close current window         |
|   n   |     `Ctrl`+`h`     | Focus window to the left     |
|   n   |     `Ctrl`+`j`     | Focus window below           |
|   n   |     `Ctrl`+`k`     | Focus window above           |
|   n   |     `Ctrl`+`l`     | Focus window to the right    |
|   n   | `Ctrl`+`Shift`+`H` | Move window to the left      |
|   n   | `Ctrl`+`Shift`+`J` | Move window below            |
|   n   | `Ctrl`+`Shift`+`K` | Move window above            |
|   n   | `Ctrl`+`Shift`+`L` | Move window to the right     |
|   n   |     `Ctrl`+`<`     | Decrease window width        |
|   n   |     `Ctrl`+`>`     | Increase window width        |
|   n   |     `Ctrl`+`-`     | Decrease window height       |
|   n   |     `Ctrl`+`+`     | Increase window height       |

#### Files/Buffers

| Modes |     Keys      | Description                          |
| :---: | :-----------: | ------------------------------------ |
|   n   | `Leader` `bd` | Change to current buffer’s directory |
|   n   | `Leader` `bw` | Write the current buffer             |
|   n   | `Leader` `ba` | Write all open buffers               |
|   n   | `Leader` `qa` | Close all open buffers               |
|   n   | `Leader` `qq` | Quit Neovim without writing anything |
|   n   | `Leader` `qw` | Quit Neovim, writing everything      |
|   n   |     `F5`      | Source current lua file              |

#### Text

| Modes |        Keys        | Description                          |
| :---: | :----------------: | ------------------------------------ |
|   n   |    `Leader` `A`    | Select all text                      |
| n, x  |        `gy`        | Copy to clipboard                    |
| n, x  |        `gp`        | Paste from clipboard (after cursor)  |
| n, x  |        `gP`        | Paste from clipboard (before cursor) |
|   t   | `Ctrl`+`Shift`+`c` | Copy from terminal into clipboard    |
|   t   | `Ctrl`+`Shift`+`v` | Paste from clipboard into terminal   |
| n, x  |        `x`         | Delete                               |
| n, x  |        `X`         | Delete                               |
|   n   |     `Alt`+`w`      | Toggle word wrap                     |
|   n   | `Alt`+`Shift`+`P`  | Toggle whitespace                    |
|   n   |   `Leader` `cq`    | Double quotes to single              |
|   n   |   `Leader` `cQ`    | Single quotes to double              |
|   n   |   `Leader` `ci`    | Reindent file                        |
|   n   |       `Esc`        | Clear search highlight               |

### Plugin keymaps

#### `alpha` (Dashboard)

| Modes |     Keys     | Description |
| :---: | :----------: | ----------- |
|   n   | `Leader` `a` | Dashboard   |

#### `better-escape` (escape insert mode)

| Modes | Keys | Description        |
| :---: | :--: | ------------------ |
|   i   | `jk` | Escape insert mode |

#### `boole` (manipulate numbers and booleans)

| Modes |    Keys    | Description |
| :---: | :--------: | ----------- |
|   n   | `Ctrl`+`a` | Increment   |
|   n   | `Ctrl`+`x` | Decrement   |

#### `bufferline` and `bufdelete` (buffer tabs)

| Modes |       Keys        | Description                |
| :---: | :---------------: | -------------------------- |
|   n   |     `Alt`+`1`     | Go to 1st buffer           |
|   n   |     `Alt`+`2`     | Go to 2nd buffer           |
|   n   |     `Alt`+`3`     | Go to 3rd buffer           |
|   n   |     `Alt`+`4`     | Go to 4th buffer           |
|   n   |     `Alt`+`5`     | Go to 5th buffer           |
|   n   |     `Alt`+`6`     | Go to 6th buffer           |
|   n   |     `Alt`+`7`     | Go to 7th buffer           |
|   n   |     `Alt`+`8`     | Go to 8th buffer           |
|   n   |     `Alt`+`9`     | Go to 9th buffer           |
|   n   |     `Alt`+`0`     | Go to last buffer          |
|   n   |     `Alt`+`p`     | Pick open buffer           |
|   n   |     `Alt`+`h`     | Go to previous buffer      |
|   n   |     `Alt`+`l`     | Go to next buffer          |
|   n   | `Alt`+`Shift`+`o` | Close other buffers        |
|   n   | `Alt`+`Shift`+`l` | Close buffers to the left  |
|   n   | `Alt`+`Shift`+`r` | Close buffers to the right |
|   n   |     `Alt`+`c`     | Close current buffer       |

#### `nvim-cmp` (autocompletion)

| Modes |      Keys      | Description                 |
| :---: | :------------: | --------------------------- |
|   n   |      `Up`      | Select previous item        |
|   n   |     `Down`     | Select next item            |
|   n   |   `Ctrl`+`p`   | Select previous item        |
|   n   |   `Ctrl`+`n`   | Select next item            |
|   n   |   `Ctrl`+`u`   | Scroll docs up              |
|   n   |   `Ctrl`+`d`   | Scroll docs down            |
|   n   | `Ctrl`+`Space` | Complete                    |
|   n   |   `Ctrl`+`e`   | Abort                       |
|   n   |    `Return`    | Confirm                     |
|   n   |   `Ctrl`+`f`   | Next snippet jump point     |
|   n   |   `Ctrl`+`b`   | Previous snippet jump point |
|   n   |     `Tab`      | Select next item            |
|   n   | `Shift`+`Tab`  | Select previous item        |

#### `floaterm` (floating terminal)

| Modes | Keys  | Description              |
| :---: | :---: | ------------------------ |
| n, t  | `F12` | Toggle floating terminal |

#### `huez` (colorscheme picker)

| Modes |     Keys      | Description  |
| :---: | :-----------: | ------------ |
|   n   | `Leader` `hs` | Colorschemes |

#### `gitsigns` (Git integration)

| Modes |     Keys      | Description               |
| :---: | :-----------: | ------------------------- |
|   n   |     `]c`      | Next changed hunk         |
|   n   |     `[c`      | Previous changed hunk     |
|   n   | `Leader` `hs` | Stage hunk                |
|   n   | `Leader` `hr` | Reset hunk                |
|   v   | `Leader` `hs` | Stage hunk                |
|   v   | `Leader` `hr` | Reset hunk                |
|   n   | `Leader` `hS` | Stage buffer              |
|   n   | `Leader` `hu` | Unstage hunk              |
|   n   | `Leader` `hR` | Reset buffer              |
|   n   | `Leader` `hp` | Preview hunk              |
|   n   | `Leader` `hb` | Blame line                |
|   n   | `Leader` `tb` | Toggle current line blame |
|   n   | `Leader` `hd` | Compare to base           |
|   n   | `Leader` `hD` | Compare to last commit    |
|   n   | `Leader` `td` | Toggle deleted            |
| o, x  |     `ih`      | Select hunk               |

#### `lazygit` (Git client)

| Modes | Keys | Description  |
| :---: | :--: | ------------ |
|   n   | `F7` | Open LazyGit |

#### `leap` (document navigation)

|  Modes  | Keys | Description      |
| :-----: | :--: | ---------------- |
| n, x, o | `s`  | Leap forward     |
| n, x, o | `S`  | Leap backward    |
| n, x, o | `gs` | Leap from window |

#### `nvim-lspconfig` (language server)

| Modes |     Keys      | Description             |
| :---: | :-----------: | ----------------------- |
|   n   |     `[d`      | Previous diagnostic     |
|   n   |     `]d`      | Next diagnostic         |
|   n   | `Leader` `e`  | Show diagnostic         |
|   n   | `Leader` `E`  | Open diagnostics list   |
|   n   | `Leader` `lr` | Rename symbol           |
| n, v  | `Leader` `ca` | Code actions            |
|   n   | `Leader` `ld` | Definition              |
|   n   | `Leader` `lR` | References              |
|   n   | `Leader` `li` | Implementations         |
|   n   | `Leader` `lD` | Type definition         |
|   n   | `Leader` `ls` | Document symbols        |
|   n   | `Leader` `lw` | Workspace symbols       |
|   n   | `Leader` `lf` | Format buffer           |
|   n   |      `K`      | Hover documentation     |
|   n   |    `<C-k>`    | Signature documentation |
|   n   |     `gD`      | Go to declaration       |
|   n   | `Leader` `wf` | Add workspace folder    |
|   n   | `Leader` `wr` | Remove workspace folder |
|   n   | `Leader` `wl` | List workspace folders  |

#### `neo-tree` (file explorer)

| Modes |     Keys     | Description         |
| :---: | :----------: | ------------------- |
|   n   |     `F2`     | File explorer       |
|   n   |     `F3`     | Open Buffers        |
|   n   |     `F4`     | Git Status          |
|   n   | `Shift`+`F2` | Close file explorer |

#### `surround` (wrap text with pairs of characters)

| Modes | Keys  | Description                    |
| :---: | :---: | ------------------------------ |
|   n   | `gz`  | Get Surround                   |
|   n   | `gZ`  | Get Indented Surround          |
|   n   | `gzr` | Get Surround Replaced          |
|   n   | `gZr` | Get Indented Surround Replaced |
|   n   | `gzd` | Get Surround Deleted           |
|   n   | `gzz` | Get String Surround            |
|   n   | `gZZ` | Get Indented String Surround   |
|   v   | `gz`  | Visual Surround                |
|   v   | `gZ`  | Visual Indented Surround       |

#### `telescope` (find things)

| Modes |     Keys      | Description           |
| :---: | :-----------: | --------------------- |
|   n   | `Leader` `ff` | Find files            |
|   n   | `Leader` `fg` | Live grep             |
|   n   | `Leader` `fb` | Open buffers          |
|   n   | `Leader` `fh` | Help tags             |
|   n   | `Leader` `fk` | Key maps              |
|   n   | `Leader` `fc` | Colorschemes          |
|   n   | `Leader` `ft` | To-do list            |
|   n   | `Leader` `fd` | Diagnostics           |
|   n   | `Leader` `f/` | Search current buffer |
|   n   | `Leader` `fm` | Messages              |
|   n   | `Leader` `fT` | Themes                |

#### `todo-comments` (to-do tags in comments)

| Modes | Keys | Description            |
| :---: | :--: | ---------------------- |
|   n   | `]t` | Next to-do comment     |
|   n   | `[t` | Previous to-do comment |

#### `trouble` (diagnostics)

| Modes |     Keys      | Description           |
| :---: | :-----------: | --------------------- |
|   n   | `Leader` `xx` | Toggle Trouble        |
|   n   | `Leader` `xw` | Workspace diagnostics |
|   n   | `Leader` `xd` | Document diagnostics  |
|   n   | `Leader` `xq` | Quickfix              |
|   n   | `Leader` `xl` | Location list         |
|   n   | `Leader` `xr` | LSP References        |
|   n   | `Leader` `xt` | LSP References        |
