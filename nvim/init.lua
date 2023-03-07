-- -------------------------------------------------------------
-- CONFIGURATION
-- -------------------------------------------------------------

-- Show line numbers
vim.opt.number = true

-- Set leader key to be `,`
vim.g.mapleader = ","

-- Use system clipboard for all commands
vim.o.clipboard = "unnamedplus"

-- Start scrolling where there are 3 lines left
vim.opt.scrolloff = 3

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Tabs have a length of 2 spaces
vim.opt.tabstop = 2

-- Indenting with `>` uses 2 spaces
vim.opt.shiftwidth = 2

-- Show whitespace with visible characters
vim.opt.list = true

-- Enable mouse support (more natural scroll when using mouse)
vim.opt.mouse = "a"

-- Always show sign column with a width of 2
vim.opt.signcolumn = "yes:2"

-- Always start with folds off
vim.opt.foldenable = false

-- Enable undofiles to persist undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/.undo')

-- Enable backups in case of bad writes
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand('~/.config/nvim/.backup')

-- Enable swapfiles in case system crashes
vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand('~/.config/nvim/.swp')

-- -------------------------------------------------------------
-- KEY MAPS
-- -------------------------------------------------------------
-- On macOS, remember to enable the Meta key.

-- Correct danish characters in insert mode with meta key: æøåÆØÅ
vim.api.nvim_set_keymap("i", "<A-'>", "æ", {})
vim.api.nvim_set_keymap("i", "<A-o>", "ø", {})
vim.api.nvim_set_keymap("i", "<A-a>", "å", {})
vim.api.nvim_set_keymap("i", '<A-">', "Æ", {})
vim.api.nvim_set_keymap("i", "<A-O>", "Ø", {})
vim.api.nvim_set_keymap("i", "<A-A>", "Å", {})

-- Emacs style bindings in command mode
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", {})
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", {})
vim.api.nvim_set_keymap("c", "<C-p>", "<Up>", {})
vim.api.nvim_set_keymap("c", "<C-n>", "<Down>", {})
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", {})
vim.api.nvim_set_keymap("c", "<M-b>", "<S-Left>", {})
vim.api.nvim_set_keymap("c", "<M-f>", "<S-Right>", {})

-- Move between windows with Ctrl-hjkl
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", {})
vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", {})
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", {})

-- Dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- `Escape` => Clear highlight
vim.api.nvim_set_keymap("n", "<esc>", ":noh<CR>", {})

-- `Space` => Open and close file explorer
vim.api.nvim_set_keymap("n", "<space>", ":NvimTreeToggle<CR>", {})

-- `, Space` => Open and close file explorer on current file
vim.api.nvim_set_keymap("n", "<leader><space>", ":NvimTreeFindFile!<CR>", {})

-- `<leader><leader>` => Go to previous buffer
vim.api.nvim_set_keymap("n", "<leader><leader>", ":b#<CR>", {})

-- `,.` => Go to alt file
vim.api.nvim_set_keymap("n", "<leader>.", ":lua altCommand()<CR>", {})

-- `,f` => Fzf files in directory
vim.api.nvim_set_keymap("n", "<leader>f", ":Files!<CR>", {})

-- `,m` => Fzf oldfiles
vim.api.nvim_set_keymap("n", "<leader>m", ":History<CR>", {})

-- `,c` => Fzf commands
vim.api.nvim_set_keymap("n", "<leader>c", ":History:<CR>", {})

-- `,a` => Fzf search in directory
vim.api.nvim_set_keymap("n", "<leader>a", ":Ag!<CR>", {})

-- `,u` => Open Undo Tree Visualizer
vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", {})

-- `,w` => Show diagnostics warning under the cursor
vim.api.nvim_set_keymap("n", "<leader>w", ":lua vim.diagnostic.open_float()<CR>", {})

-- `,d` => Go to definition for keyword under cursor
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", {})

-- `,R` => Show references for keyword under cursor
vim.api.nvim_set_keymap("n", "<leader>R", "<cmd>lua vim.lsp.buf.references()<CR>", {})

-- `,R` => Show references for keyword under cursor
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>", {})

-- `,S` => Split single-line statement to multi-line
vim.api.nvim_set_keymap("n", "<leader>S", ":SplitjoinSplit<CR>", {})

-- `,J` => Join multi-line statement to single-line
vim.api.nvim_set_keymap("n", "<leader>J", ":SplitjoinJoin<CR>", {})

-- `,i` => Copy file path and line number to clipboard
vim.api.nvim_set_keymap("n", "<leader>i", ':let @*=expand("%") . ":" . line(".")<CR>', {})

-- `,s` => Search using the ferret plugin
vim.api.nvim_set_keymap("n", "<leader>s", ':Search ', {})

-- `,r` => SearchReplace using the ferret plugin (/search/replace/)
vim.api.nvim_set_keymap("n", "<leader>r", ':SearchReplace ', {})

-- `,g` => Go to last migration file
vim.api.nvim_set_keymap("n", "<leader>g", ':e `find db/migrate -maxdepth 1 \\| sort \\| tail -n -1`<CR>', {})

-- `,l` => Navigate git history of file in buffer
vim.api.nvim_set_keymap("n", "<leader>l", ':0Gclog<CR>', {})

-- `,t` => Navigate git history of file in buffer
vim.api.nvim_set_keymap("n", "<leader>t", ':TestNearest<CR>', {})

-- -------------------------------------------------------------
-- `:W` custom function: Run formatting and save
-- -------------------------------------------------------------

-- :W runs formatting and saves
vim.api.nvim_create_user_command("W",
function(input)
  vim.lsp.buf.format()
  vim.api.nvim_command('write')
end,
{})

-- -------------------------------------------------------------
-- `:Search` custom function: Search files with ferret
-- -------------------------------------------------------------

-- Just an alias, ferret command names are ridiculous
vim.api.nvim_create_user_command("Search",
function(opts)
  vim.api.nvim_command('Lack ' .. opts.args)
end,
{ nargs = 1 })

-- -------------------------------------------------------------
-- `:SearchReplace` custom function: Search files with ferret
-- -------------------------------------------------------------

-- Just an alias, ferret command names are ridiculous
vim.api.nvim_create_user_command("SearchReplace",
function(opts)
  vim.api.nvim_command('Lacks ' .. opts.args)
end,
{ nargs = 1 })

-- -------------------------------------------------------------
-- Custom function: Go to Alternative file
-- -------------------------------------------------------------

function altCommand()
  local handle = io.popen('alt ' .. vim.fn.expand('%'))
  local f = handle:read("*a")
  if (f == "") then
    print("No alternate file for " .. vim.fn.expand('%') .. " exists!")
  else
    vim.cmd("e " .. f)
  end
end

-- -------------------------------------------------------------
-- AUTO COMMANDS
-- -------------------------------------------------------------

-- Restore cursor position when loading files (this is default in vim)
vim.api.nvim_exec([[autocmd! BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]], false)

-- source init.lua on save
vim.api.nvim_create_augroup("neovim_configuration", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "source init.lua on Save",
  group = "neovim_configuration",
  pattern = "init.lua",
  command = "luafile %",
})

-- -------------------------------------------------------------
-- LANGUAGE SERVERS
-- -------------------------------------------------------------

local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Display warnings with signs, but without text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true
  }
)

lspconfig["solargraph"].setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  cmd = { "bundle", "exec", "solargraph", "stdio" }
}

lspconfig["efm"].setup {
  on_attach = on_attach,
  init_options = { documentformatting = true },
  root_dir = vim.loop.cwd,
  filetypes = { "eruby" },
}

lspconfig["yamlls"].setup {
  on_attach = on_attach,
  filetypes = { "yaml" },
  settings = {
    yaml = {
      validate = true,
      schemas = {
        kubernetes = '/*.k8s.yml',
      }
    }
  }
}

-- Hack to enable completion in json files, see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
local jsonls_capabilities = vim.lsp.protocol.make_client_capabilities()
jsonls_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig["jsonls"].setup {
  capabilities = jsonls_capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      validate = { enable = true },
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig',
        },
      },
    },
  }
}

-- This extends the lspconfig["tsserver"]
require("typescript").setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
  },
  server = {} -- pass options to lspconfig's setup method
}

-- -------------------------------------------------------------
-- PACKAGE: Nvim-Tree, File Explorer
-- -------------------------------------------------------------

-- Disable the default file explorer (recommended by plugin)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  -- Close tree when we open a file
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  -- Increase with to show large file names
  view = {
    width = 50
  },
  -- Show git icons in leftmost columns, so that do not affect indentation
  renderer = {
    icons = {
      git_placement = "signcolumn"
    }
  }
})

-- -------------------------------------------------------------
-- PACKAGE: tokyonight, Color scheme
-- -------------------------------------------------------------

-- Alternative theme
-- vim.cmd[[colorscheme tokyonight-night]]

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- -------------------------------------------------------------
-- PACKAGE: gitsigns, + and - signs
-- -------------------------------------------------------------
require('gitsigns').setup()

-- -------------------------------------------------------------
-- PACKAGE: Indentation Guides
-- -------------------------------------------------------------

-- Set the color of indentation guides
vim.cmd [[highlight IndentBlanklineChar guifg=#504945 gui=nocombine]]

-- -------------------------------------------------------------
-- PACKAGE: nvim-cmp
-- -------------------------------------------------------------
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- -------------------------------------------------------------
-- PACKAGES
-- -------------------------------------------------------------
-- The package manager is loaded from this location at startup:
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Manage Packer itself
  use 'wbthomason/packer.nvim'

  -- File Explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Color schemes
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- Visualize the Undo Tree
  use 'mbbill/undotree'

  -- Fuzzy finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Language Server Protocol configuration
  use 'neovim/nvim-lspconfig'

  -- Jump to specific line number when opening files
  use 'wsdjeg/vim-fetch'

  -- Show + and - on added removed files since last commit
  use 'lewis6991/gitsigns.nvim'

  -- Switch between single- and multi-line statements
  use 'AndrewRadev/splitjoin.vim'

  -- :Search and :SearchReplace in location-list window
  use 'wincent/ferret'

  -- Indentation Guides
  use "lukas-reineke/indent-blankline.nvim"

  -- Git integration
  use "tpope/vim-fugitive"

  -- Integrated Testing
  use "vim-test/vim-test"

  -- Support the Crystal Language
  use "vim-crystal/vim-crystal"

  -- Support for adonisjs's .edge templates
  use "watzon/vim-edge-template"

  -- Completion engine (useful for typescript)
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"

  -- Typescript language server
  use 'jose-elias-alvarez/typescript.nvim'
end)
