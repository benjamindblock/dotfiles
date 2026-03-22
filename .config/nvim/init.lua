-- ==============================================================================
-- Plugin Installation (vim-plug)
-- ==============================================================================

local plug = vim.fn["plug#"]
vim.call("plug#begin", vim.fn.stdpath("data") .. "/plugged")

-- Editing enhancements
plug("tpope/vim-commentary")
plug("tpope/vim-endwise")
plug("tpope/vim-vinegar")

-- Testing
plug("junegunn/vader.vim")

-- Outliner
plug("vim-voom/VOoM")

-- Search
plug("jremmen/vim-ripgrep")

-- Language / syntax
plug("junegunn/rainbow_parentheses.vim")
plug("andymass/vim-matchup")
plug("zaid/vim-rec")
plug("Tetralux/odin.vim")

-- LSP + completion
plug("hrsh7th/nvim-cmp")
plug("hrsh7th/cmp-nvim-lsp")
plug("ray-x/lsp_signature.nvim")

-- Colors
-- plug("wincent/base16-nvim")

vim.call("plug#end")

-- ==============================================================================
-- Global Variables
-- ==============================================================================

vim.g.mapleader = " "

-- Recutils: disable folding (file format is too flat for it to be useful)
vim.g.recutils_no_folding = 1

-- vim-matchup: use a rounded border for the off-screen match popup.
vim.g.matchup_popup_options = { border = "rounded" }

-- Netrw: open splits to the right
vim.g.netrw_altv = 1

-- VOoM outline panel width
vim.g.voom_tree_width = 38

-- ==============================================================================
-- Options
-- ==============================================================================

local opt = vim.opt

-- Visual
opt.termguicolors = true
opt.background    = "dark"
opt.cursorline    = true
opt.number        = true
opt.relativenumber = true
opt.title         = true
opt.signcolumn    = "number"
opt.lazyredraw    = true
opt.listchars     = { tab = "> ", trail = "-", extends = ">", precedes = "<", nbsp = "+" }

-- Indentation defaults (overridden per filetype via autocommands)
opt.tabstop     = 2
opt.softtabstop = 2
opt.shiftwidth  = 2
opt.expandtab   = true
opt.autoindent  = true

-- Search
opt.incsearch  = true
opt.hlsearch   = true
opt.ignorecase = true
opt.smartcase  = true

-- Scrolling
opt.scrolloff     = 3
opt.sidescrolloff = 5

-- Clipboard / mouse
opt.clipboard = "unnamed"
opt.mouse     = "n"

-- Undo persistence
opt.undofile = true
opt.undodir  = vim.fn.expand("~/.local/share/nvim/undo//")

-- Wildmenu / completion
opt.wildmenu = true
opt.wildignore:append({ "*/node_modules", "*/tmp", "*/storage", "*/app/assets/fonts" })
opt.path:append("**")

-- ==============================================================================
-- Colorscheme
-- ==============================================================================

-- Load after options so termguicolors is set first.
-- vim.cmd("colorscheme torte")

-- Lua
vim.cmd([[colorscheme torte]])

-- Less visible window separator
vim.api.nvim_set_hl(0, "WinSeparator", { fg = 1250067 })

-- Make it clearly visible which argument we're at.
local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })

-- ==============================================================================
-- Keymaps
-- ==============================================================================

local map = vim.keymap.set

-- Move current line up/down
map("n", "<C-S-Up>",   ":m -2<CR>",   { silent = true })
map("n", "<C-S-Down>", ":m +1<CR>",   { silent = true })

-- Clear search highlight
map("n", "<leader>,", ":nohlsearch<CR>", { silent = true })

-- Jump to previous buffer
map("n", "<leader><BS>", "<C-^>", { silent = true })

-- Hash rocket (Ruby)
map("i", "<C-l>", " => ")

-- Resync syntax highlighting
map("n", "U", ":syntax on<CR>:syntax sync fromstart<CR>:redraw!<CR>", { silent = true })

-- Disable rdoc lookup — crashes the terminal when no rdoc is available.
-- LSP's K (hover) is mapped on LspAttach below, which will override this for
-- buffers where an LSP server is active.
map("n", "K", "<Nop>")

-- Ruby debug puts
map("n", "<leader>wtf", 'oputs "#" * 90<C-m>puts caller<C-m>puts "#" * 90<Esc>')

-- VOoM note-taking
map("n", ",n", ":VOoM<CR>", { silent = true })

-- StarDict lookup in a scratch buffer.
-- Opens the definition in a new split; ScratchBufferize makes it ephemeral.
map("n", ",d", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("new")
  vim.cmd("read ! sdcv " .. word)
  vim.bo.buftype   = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile  = false
  vim.cmd("normal! gg")
end)

-- Test runner
map("n", "<CR>", function() RunTestFile() end)

-- Switch between test and production file
map("n", "<leader>.", function() OpenTestAlternate() end)

-- ==============================================================================
-- Fuzzy File Finder (fzy)
-- ==============================================================================

local function fzy_command(choice_cmd, fzy_args, vim_cmd)
  local ok, selection = pcall(function()
    return vim.fn.system(choice_cmd .. " | fzy " .. fzy_args)
  end)
  vim.cmd("redraw!")
  if not ok or selection == nil or selection == "" then
    return
  end
  -- Strip trailing newline that system() appends
  selection = selection:gsub("\n$", "")
  if selection ~= "" then
    vim.cmd(vim_cmd .. " " .. vim.fn.fnameescape(selection))
  end
end

map("n", "<leader>t", function()
  fzy_command("fd -t f -H", "", ":e")
end)

-- ==============================================================================
-- Test Runner
-- ==============================================================================
-- Remembers the last test file run on a per-tab basis (via vim.t). Hitting
-- <CR> in a test file sets it as the current test; hitting <CR> anywhere
-- else re-runs the most recently set test.

function RunTestFile(suffix)
  suffix = suffix or ""
  local in_test = vim.fn.expand("%"):match("_test%.rb$") ~= nil

  if in_test then
    SetTestFile(suffix)
  elseif vim.t.grb_test_file == nil then
    return
  end

  RunTests(vim.t.grb_test_file)
end

function SetTestFile(suffix)
  vim.t.grb_test_file = vim.fn.expand("%") .. suffix
end

function RunTests(filename)
  if vim.fn.expand("%") ~= "" then
    vim.cmd("w")
  end

  if vim.fn.executable(filename) == 1 then
    vim.cmd(":!" .. "./" .. filename)
  elseif vim.fn.filereadable("bin/test") == 1 then
    vim.cmd(":!bin/test " .. filename)
  elseif vim.fn.filereadable("Gemfile") == 1
      and vim.fn.glob("test/**/*.rb") ~= "" then
    vim.cmd(":!bin/rails test " .. filename)
  end
end

-- ==============================================================================
-- Test / Production File Alternation
-- ==============================================================================
-- Switches between app/…/foo.rb ↔ test/…/foo_test.rb, following Rails
-- conventions for controllers, models, workers, views, helpers, services, and
-- jobs.

local app_dirs = {
  "controllers", "models", "workers", "views", "helpers", "services", "jobs"
}

local function is_in_app(path)
  for _, dir in ipairs(app_dirs) do
    if path:match("%f[%w]" .. dir .. "%f[%W]") then
      return true
    end
  end
  return false
end

function AlternateForCurrentFile()
  local current = vim.fn.expand("%")
  local in_test = current:match("^test/") ~= nil

  if in_test then
    -- test → app: strip test/ prefix and _test.rb suffix
    local new = current:gsub("_test%.rb$", ".rb"):gsub("^test/", "")
    if is_in_app(new) then
      new = "app/" .. new
    end
    return new
  else
    -- app → test: strip app/ prefix (if in an app dir) and add test/ + _test suffix
    local new = current
    if is_in_app(new) then
      new = new:gsub("^app/", "")
    end
    new = new:gsub("%.e?rb$", "_test.rb")
    return "test/" .. new
  end
end

function OpenTestAlternate()
  vim.cmd(":e " .. AlternateForCurrentFile())
end

-- ==============================================================================
-- VOoM Note-taking
-- ==============================================================================

local function enable_voom()
  vim.cmd("Voom markdown")
  print("Note Mode")
end

vim.api.nvim_create_user_command("VOoM", enable_voom, {})

-- ==============================================================================
-- Autocommands
-- ==============================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local vimrc_ex = augroup("vimrcEx", { clear = true })

-- Restore cursor to last known position when reopening a file.
autocmd("BufReadPost", {
  group   = vimrc_ex,
  pattern = "*",
  callback = function()
    local last = vim.fn.line("'\"")
    if last > 0 and last <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- Ruby-family: 2-space soft tabs
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = { "ruby", "haml", "eruby", "yaml", "html", "sass", "cucumber", "sql" },
  callback = function()
    vim.bo.shiftwidth  = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab   = true
    vim.bo.autoindent  = true
  end,
})

-- Python: 4-space soft tabs
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
  end,
})

-- Odin: hard tabs, 4-wide
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "odin",
  callback = function()
    vim.bo.expandtab   = false
    vim.bo.tabstop     = 4
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 0
    vim.bo.autoindent  = true
    vim.bo.copyindent  = true
    vim.opt_local.preserveindent = true
  end,
})

-- Sass: detect filetype from extension (not reliably detected by default)
autocmd({ "BufRead", "BufNewFile" }, {
  group   = vimrc_ex,
  pattern = "*.sass",
  callback = function()
    vim.bo.filetype = "sass"
  end,
})

-- Markdown: 4-space soft tabs + prose format options
autocmd({ "BufRead", "BufNewFile" }, {
  group   = vimrc_ex,
  pattern = { "*.mkd", "*.markdown" },
  callback = function()
    vim.bo.autoindent   = true
    vim.opt_local.formatoptions = "tcroqn2"
    vim.opt_local.comments      = "n:>"
  end,
})
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "markdown",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
  end,
})

-- VCL: 4-space soft tabs
autocmd("BufRead", {
  group   = vimrc_ex,
  pattern = "*.vcl",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
  end,
})

-- JavaScript / JSON: 2-space soft tabs
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = { "javascript", "json" },
  callback = function()
    vim.bo.shiftwidth  = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab   = true
  end,
})

-- Lisp family: enable rainbow parentheses + lispindent
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = { "lisp", "clojure", "scheme" },
  callback = function()
    vim.cmd("RainbowParentheses")
    vim.bo.equalprg = "lispindent.lisp"
  end,
})

-- Makefile: hard tabs (make requires them), 2-wide for display
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "make",
  callback = function()
    vim.bo.expandtab   = false
    vim.bo.shiftwidth  = 2
    vim.bo.softtabstop = 2
  end,
})

-- ==============================================================================
-- LSP Configuration
-- ==============================================================================
-- Uses the native vim.lsp.config / vim.lsp.enable API (Neovim ≥0.11).

vim.diagnostic.config({
  float = { border = "rounded" },
})

-- Apply rounded borders to the two LSP floating windows that aren't covered
-- by lsp_signature (which has its own config) or nvim-cmp.
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Extend default client capabilities with nvim-cmp's LSP additions so that
-- servers know we support snippet completion, resolve support, etc.
local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
  vim.lsp.config("*", {
    capabilities = cmp_nvim_lsp.default_capabilities(),
  })
end

-- Set buffer-local keymaps and plugins whenever an LSP server attaches.
autocmd("LspAttach", {
  group = vimrc_ex,
  callback = function(ev)
    local bufnr = ev.buf
    local bopts = { buffer = bufnr, silent = true }

    map("n", "gd",         vim.lsp.buf.definition,   bopts)
    map("n", "K",          vim.lsp.buf.hover,         bopts)
    map("n", "<leader>rn", vim.lsp.buf.rename,        bopts)
    map("n", "<leader>ca", vim.lsp.buf.code_action,   bopts)
    map("n", "<C-k>",      vim.diagnostic.goto_prev,  bopts)
    map("n", "<C-j>",      vim.diagnostic.goto_next,  bopts)
    map("n", "<leader>a",  vim.diagnostic.open_float, bopts)

    -- Show function signature hints while typing arguments.
    local ok_sig, lsp_signature = pcall(require, "lsp_signature")
    if ok_sig then
      lsp_signature.on_attach({
        bind         = true,
        hint_enable  = false,
        handler_opts = { border = "rounded" },
      }, bufnr)
    end
  end,
})

-- ts_ls and denols both handle TS/JS. root_markers alone can't express mutual
-- exclusion — it only sets the root, it doesn't gate startup. Instead, ts_ls
-- uses a root_dir function: if a Deno project marker is found above the file,
-- on_dir is never called and the server doesn't start for that buffer.
vim.lsp.config("ts_ls", {
  cmd      = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = function(bufnr, on_dir)
    if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then return end
    local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json" })
    if root then on_dir(root) end
  end,
})

vim.lsp.config("denols", {
  cmd       = { "deno", "lsp" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir  = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
    if root then on_dir(root) end
  end,
})

vim.lsp.config("rubocop", {
  cmd          = { "rubocop", "--lsp" },
  filetypes    = { "ruby" },
  root_markers = { ".rubocop.yml", "Gemfile", ".git" },
})

vim.lsp.config("ruff", {
  cmd          = { "ruff", "server" },
  filetypes    = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
})

vim.lsp.enable({ "ts_ls", "denols", "rubocop", "ruff" })

vim.lsp.config("herb", {
  cmd          = { "herb-language-server" },
  filetypes    = { "eruby", "html.erb" },
  root_markers = { ".git", "Gemfile" },
})
if vim.fn.executable("herb-language-server") == 1 then
  vim.lsp.enable("herb")
end

-- ==============================================================================
-- Completion (nvim-cmp)
-- ==============================================================================

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
    ["<C-f>"]     = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>']     = cmp.mapping.abort(),
    -- Accept currently selected item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>']      = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
  }),
})
