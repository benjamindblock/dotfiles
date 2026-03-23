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
plug("ibhagwan/fzf-lua")

-- Language / syntax
plug("junegunn/rainbow_parentheses.vim")
plug("andymass/vim-matchup")
plug("zaid/vim-rec")
plug("Tetralux/odin.vim")

-- LSP + linting + completion
plug("dense-analysis/ale")
plug("hrsh7th/nvim-cmp")
plug("hrsh7th/cmp-nvim-lsp")

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
vim.cmd([[colorscheme torte]])

-- Less visible window separator
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#131313" })

-- ==============================================================================
-- Test Runner
-- ==============================================================================
-- Remembers the last test file run on a per-tab basis (via vim.t). Hitting
-- <CR> in a test file sets it as the current test; hitting <CR> anywhere
-- else re-runs the most recently set test.

local function SetTestFile(suffix)
  vim.t.grb_test_file = vim.fn.expand("%") .. suffix
end

local function RunTests(filename)
  if vim.fn.expand("%") ~= "" then
    vim.cmd("w")
  end

  if vim.fn.executable(filename) == 1 then
    vim.cmd("!" .. "./" .. filename)
  elseif vim.fn.filereadable("bin/test") == 1 then
    vim.cmd("!bin/test " .. filename)
  elseif vim.fn.filereadable("Gemfile") == 1
      and vim.fn.glob("test/**/*.rb") ~= "" then
    vim.cmd("!bin/rails test " .. filename)
  end
end

local function RunTestFile(suffix)
  suffix = suffix or ""
  local in_test = vim.fn.expand("%"):match("_test%.rb$") ~= nil

  if in_test then
    SetTestFile(suffix)
  elseif vim.t.grb_test_file == nil then
    return
  end

  RunTests(vim.t.grb_test_file)
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

local function AlternateForCurrentFile()
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

local function OpenTestAlternate()
  vim.cmd("e " .. AlternateForCurrentFile())
end

-- ==============================================================================
-- Fuzzy File Finder (fzf-lua)
-- ==============================================================================

local ok_fzf, fzf = pcall(require, "fzf-lua")
if ok_fzf then
  fzf.setup({
    winopts = {
      -- Bottom-anchored split matching the old fzy layout.
      split = "botright 10new",
      preview = {
        -- Disable treesitter in previews so they use the same regex
        -- syntax highlighting as the main buffer. Without this,
        -- selecting a file flickers as treesitter preview colors are
        -- replaced by regex syntax colors.
        treesitter = { enabled = false },
      },
    },
    files = {
      -- Same flags the old fzy mapping used.
      fd_opts = "--type f --hidden",
    },
  })
end

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

-- ALE: LSP navigation and code actions. These are global (not buffer-local) because
-- ALE no-ops gracefully on buffers with no active LSP server.
--
-- K (hover) and Z (detail) both close any existing float first, so one
-- replaces the other in a single keypress. Pressing the same key twice
-- toggles the float off. We track which command owns the current float
-- so we can distinguish "replace" from "toggle off".
local ale_float_owner = nil

local function ale_float_toggle(cmd)
  local had_own_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      if ale_float_owner == cmd then had_own_float = true end
      vim.api.nvim_win_close(win, true)
    end
  end
  -- Toggle off if we just closed our own float; otherwise open.
  if had_own_float then
    ale_float_owner = nil
  else
    ale_float_owner = cmd
    vim.cmd(cmd)
  end
end

map("n", "K", function() ale_float_toggle("ALEHover") end,  { silent = true })
map("n", "Z", function() ale_float_toggle("ALEDetail") end, { silent = true })
map("n", "<leader>rn", "<Plug>(ale_rename)",           { silent = true })
map("n", "<C-k>",      "<Plug>(ale_previous_wrap)",    { silent = true })
map("n", "<C-j>",      "<Plug>(ale_next_wrap)",        { silent = true })
map("n", "gr",         "<Plug>(ale_find_references)",  { silent = true })

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
map("n", "<CR>", RunTestFile)

-- Switch between test and production file
map("n", "<leader>.", OpenTestAlternate)

-- Fuzzy file finder
map("n", "<leader>t", function()
  require("fzf-lua").files()
end)

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
vim.filetype.add({ extension = { sass = "sass" } })

-- Markdown: 4-space soft tabs + prose format options
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "markdown",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
    vim.bo.autoindent  = true
    vim.opt_local.formatoptions = "tcroqn2"
    vim.opt_local.comments      = "n:>"
  end,
})

-- VCL: 4-space soft tabs
autocmd({ "BufRead", "BufNewFile" }, {
  group   = vimrc_ex,
  pattern = "*.vcl",
  callback = function()
    vim.bo.shiftwidth  = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab   = true
  end,
})

-- JavaScript / TypeScript / JSON: 2-space soft tabs
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
  callback = function()
    vim.bo.shiftwidth  = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab   = true
  end,
})

-- tslsp / deno mutual exclusion
-- ALE lists both as enabled when both are in g:ale_linters, even when the
-- custom project_root functions return '' (ALE's built-in definitions load
-- independently and don't inherit the overrides). Setting b:ale_linters
-- per-buffer ensures only the appropriate server runs.
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    local has_deno = vim.fn.findfile("deno.json", ".;") ~= ""
      or vim.fn.findfile("deno.jsonc", ".;") ~= ""
    if has_deno then
      vim.b.ale_linters = { "deno" }
    else
      vim.b.ale_linters = { "tslsp" }
    end
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

-- Disable treesitter highlighting so the regex syntax engine is the sole
-- highlighter. This prevents the brief "flicker" where both systems
-- load in sequence, and preserves torte's full color palette (which
-- targets traditional syntax groups, not treesitter @captures).
-- The treesitter parser itself remains active for other features
-- (indentation, text objects, etc.) — only the highlighting is removed.
autocmd("FileType", {
  group   = vimrc_ex,
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.stop, args.buf)
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
-- ALE Configuration
-- ==============================================================================
-- ALE manages linting and LSP servers. With g:ale_use_neovim_lsp_api = 1
-- (the Neovim 0.8+ default), ALE starts LSP servers through Neovim's native
-- LSP client, so nvim-cmp / cmp-nvim-lsp work without any extra wiring.

-- Only run the linters we explicitly list; suppress ALE's built-in defaults
-- for filetypes not covered here.
vim.g.ale_linters_explicit = 1

vim.g.ale_linters = {
  typescript      = { "tslsp", "deno" },
  typescriptreact = { "tslsp", "deno" },
  javascript      = { "tslsp", "deno" },
  javascriptreact = { "tslsp", "deno" },
  ruby            = { "rubocop", "solargraph" },
  python          = { "ruff" },
  eruby           = { "herb" },
}

-- Rounded floating windows match the rest of the UI.
vim.g.ale_floating_preview       = 1
vim.g.ale_floating_window_border = { "│", "─", "╭", "╮", "╯", "╰", "│", "─" }

-- Show virtual-text diagnostics only on the current line to avoid clutter
-- in dense files.
vim.g.ale_virtualtext_cursor = "current"

-- Pass nvim-cmp's extended capabilities to every LSP server ALE starts so
-- servers advertise snippet completion, resolve support, etc. ALE calls
-- vim.lsp.start() internally and inherits these global defaults.
local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp_lsp then
  vim.lsp.config("*", {
    capabilities = cmp_nvim_lsp.default_capabilities(),
  })
end

-- Configure the Neovim diagnostics float border globally (used by ALE's
-- detail window and any direct vim.diagnostic.open_float() calls).
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- tslsp / deno mutual exclusion is handled by the b:ale_linters autocommand
-- in the Autocommands section above. The project_root override approach via
-- ale#linter#Define didn't work reliably — ALE's built-in linter definitions
-- load independently and don't inherit the custom project_root functions.
--
-- tslsp (TypeScript/JavaScript LSP)
-- ──────────────────────────────────
-- ALE's built-in `tsserver` linter uses TypeScript's proprietary protocol
-- ('lsp': 'tsserver'), which ALE explicitly excludes from Neovim's native
-- LSP client. That means cmp-nvim-lsp never sees the server and completions
-- don't work. We define a custom `tslsp` linter that uses
-- typescript-language-server (a standard LSP stdio wrapper around tsserver)
-- so ALE routes it through vim.lsp.start() and cmp-nvim-lsp can provide
-- completions.
--
-- `'language': ''` is required so ALE falls back to the buffer's filetype
-- for the LSP languageId. Without it, ALE uses the registration filetype
-- (always 'typescript' due to the typescriptreact→typescript alias),
-- causing the server to treat .tsx/.jsx files as plain .ts/.js.
--
-- herb (eruby LSP)
-- ────────────────
-- herb-language-server is a less common tool; the custom root function returns
-- empty when no Gemfile is found, keeping eruby buffers clean in projects
-- that don't use it.
vim.cmd([[
  function! s:HerbRoot(buffer) abort
    let l:found = ale#path#FindNearestFile(a:buffer, 'Gemfile')
    return empty(l:found) ? '' : fnamemodify(l:found, ':h')
  endfunction

  call ale#linter#Define('eruby', {
  \   'name':         'herb',
  \   'lsp':          'stdio',
  \   'executable':   'herb-language-server',
  \   'command':      '%e --stdio',
  \   'project_root': function('s:HerbRoot'),
  \ })

  for s:ft in ['typescript', 'typescriptreact', 'javascript', 'javascriptreact']
    call ale#linter#Define(s:ft, {
    \   'name':         'tslsp',
    \   'lsp':          'stdio',
    \   'language':     '',
    \   'executable':   'typescript-language-server',
    \   'command':      '%e --stdio',
    \   'project_root': function('ale#handlers#tsserver#GetProjectRoot'),
    \ })
  endfor
]])

-- ==============================================================================
-- Completion (nvim-cmp)
-- ==============================================================================

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

-- Colors for the completion list and documentation windows.
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#2d2d2d" })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#2d2d2d" })

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal,FloatBorder:Normal,CursorLine:Visual,Search:None",
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpDocNormal,FloatBorder:Normal,CursorLine:Visual,Search:None",
    }
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
