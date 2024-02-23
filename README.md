# My Neovim Setup

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/PeterShaws/nvim-setup.git ~/.config/nvim
   ```

2. `cd` into `~/.config/nvim`
3. Launch Neovim and wait for Lazy's UI to appear, then wait for it to sync all
   plugins
4. You should be good to go; if not, relaunch Neovim

## Dependencies

1. `nodejs`/`npm` -- to download LSPs, formatters, etc.
2. `rg` -- for fuzzy finding
3. `fd` -- for finding files
4. `lazygit`

   - `ydiff` (optional, a pager that can show diffs side-by-side). Configured
     like so:

     ```yaml
     gui:
       sidePanelWidth: 0.2
     git:
       paging:
         colorArg: never
         pager: ydiff -p cat -s --wrap --width={{columnWidth}}
     ```

## Keymaps

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

| Modes |    Keys    | Description               |
| :---: | :--------: | ------------------------- |
|   n   | `Ctrl`+`h` | Focus window to the left  |
|   n   | `Ctrl`+`j` | Focus window below        |
|   n   | `Ctrl`+`k` | Focus window above        |
|   n   | `Ctrl`+`l` | Focus window to the right |
|   n   | `Ctrl`+`c` | Close current window      |

#### Files/Buffers

| Modes |     Keys      | Description                          |
| :---: | :-----------: | ------------------------------------ |
|   n   | `Leader` `bd` | Change to buffer’s directory         |
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
|   t   | `Ctrl`+`Shift`+`C` | Copy from terminal into clipboard    |
|   t   | `Ctrl`+`Shift`+`V` | Paste from clipboard into terminal   |
| n, x  |        `x`         | Delete                               |
| n, x  |        `X`         | Delete                               |
|   n   |     `Alt`+`w`      | Toggle word wrap                     |
|   n   |   `Leader` `cq`    | Double quotes to single              |
|   n   |   `Leader` `cQ`    | Single quotes to double              |
|   n   |   `Leader` `ci`    | Reindent file                        |
|   n   |       `Esc`        | Clear search highlight               |

### Plugin keymaps

#### `alpha` (Dashboard)

| Modes |     Keys     | Description |
| :---: | :----------: | ----------- |
|   n   | `Leader` `a` | Dashboard   |

#### `better-escape`

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

| Modes | Keys  | Description            |
| :---: | :---: | ---------------------- |
|   n   | `F12` | Open floating terminal |

#### `gitsigns` (Git integration)

| Modes |     Keys      | Description               |
| :---: | :-----------: | ------------------------- |
|   n   |     `]c`      | Next change               |
|   n   |     `[c`      | Previous change           |
|   n   | `Leader`+`hs` | Stage hunk                |
|   n   | `Leader`+`hr` | Reset hunk                |
|   v   | `Leader`+`hs` | Stage hunk                |
|   v   | `Leader`+`hr` | Reset hunk                |
|   n   | `Leader`+`hS` | Stage buffer              |
|   n   | `Leader`+`hu` | Unstage hunk              |
|   n   | `Leader`+`hR` | Reset buffer              |
|   n   | `Leader`+`hp` | Preview hunk              |
|   n   | `Leader`+`hb` | Blame line                |
|   n   | `Leader`+`tb` | Toggle current line blame |
|   n   | `Leader`+`hd` | Compare to base           |
|   n   | `Leader`+`hD` | Compare to last commit    |
|   n   | `Leader`+`td` | Toggle deleted            |
| o, x  |     `ih`      | Select hunk               |

#### `lazygit` (Git client)

| Modes | Keys | Description  |
| :---: | :--: | ------------ |
|   n   | `F7` | Open LazyGit |

#### `leap` (document navigation)

|  Modes  | Keys | Description      |
| :-----: | :--: | ---------------- |
| n, x, o |  s   | Leap forward     |
| n, x, o |  S   | Leap backward    |
| n, x, o |  gs  | Leap from window |

#### `nvim-lspconfig` (language server)

| Modes |     Keys      | Description             |
| :---: | :-----------: | ----------------------- |
|   n   |     `[d`      | Previous diagnostic     |
|   n   |     `]d`      | Next diagnostic         |
|   n   | `Leader`+`e`  | Show diagnostic         |
|   n   | `Leader`+`E`  | Open diagnostics list   |
|   n   |     `gD`      | Go to declaration       |
|   n   |     `gd`      | Go to definition        |
|   n   |      `K`      | Hover                   |
|   n   |     `gi`      | Go to implementation    |
|   n   |    `<C-k>`    | Show signature          |
|   n   | `Leader`+`wf` | Add workspace folder    |
|   n   | `Leader`+`wr` | Remove workspace folder |
|   n   | `Leader`+`wl` | List workspace folders  |
|   n   | `Leader`+`D`  | Go to type definition   |
|   n   | `Leader`+`rn` | Rename                  |
| n, v  | `Leader`+`ca` | Code actions            |
|   n   |     `gr`      | List references         |
|   n   | `Leader`+`bf` | Format buffer           |

#### `neo-tree` (file explorer)

| Modes |     Keys     | Description         |
| :---: | :----------: | ------------------- |
|   n   |     `F2`     | File explorer       |
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
|   n   | `Leader`+`ff` | Find files            |
|   n   | `Leader`+`fg` | Live grep             |
|   n   | `Leader`+`fb` | Open buffers          |
|   n   | `Leader`+`fh` | Help tags             |
|   n   | `Leader`+`fk` | Key maps              |
|   n   | `Leader`+`fc` | Switch colorscheme    |
|   n   | `Leader`+`ft` | Treesitter symbols    |
|   n   | `Leader`+`fs` | Document symbols      |
|   n   | `Leader`+`fw` | Workspace symbols     |
|   n   | `Leader`+`fd` | Diagnostics           |
|   n   | `Leader`+`f/` | Search current buffer |
|   n   | `Leader`+`fm` | Messages              |

#### `trouble` (diagnostics)

| Modes |     Keys      | Description           |
| :---: | :-----------: | --------------------- |
|   n   | `Leader`+`xx` | Toggle Trouble        |
|   n   | `Leader`+`xw` | Workspace diagnostics |
|   n   | `Leader`+`xd` | Document diagnostics  |
|   n   | `Leader`+`xq` | Quickfix              |
|   n   | `Leader`+`xl` | Location list         |
|   n   | `Leader`+`xr` | LSP References        |

## Optional

Use [Neovide](https://neovide.dev) as a GUI for Neovim. Example configuration:

`~/.config/neovide/config.toml`

```toml
[font]
normal = { "family" = "JetBrainsMono Nerd Font", "style" = "ExtraLight" }
size = 16
hinting = "none"
edging = "subpixelantialias"
```

This Neovim setup has keymaps for copying/pasting in Neovide while in terminal
mode (useful e.g. for LazyGit).

## Plugins used

- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [famiu/bufdelete.nvim](https://github.com/famiu/bufdelete.nvim)
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- [folke/lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim)
- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [ggandor/leap.nvim](https://github.com/ggandor/leap.nvim)
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim)
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nat-418/boole.nvim](https://github.com/nat-418/boole.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-telescope/telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [s1n7ax/nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
