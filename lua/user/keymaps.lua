local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

keymap("n", "<leader>,", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>u", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find <CR>", opts)
keymap("n", "<leader>th", ":Telescope help_tags <CR>", opts)
keymap("n", "<leader>f", ":Telescope file_browser <CR>", opts)
keymap("n", "<leader>m", ":Telescope marks <CR>", opts)
keymap("n", "<leader>r", ":Telescope registers <CR>", opts)
keymap("n", "<leader>ts", ":Telescope builtin <CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status <CR>", opts)
keymap("n", "<leader>gc", ":Telescope git_commits <CR>", opts)
-- I currently prefer Ag search for this
keymap("n", "<leader>'", ":Telescope grep_string <CR>", opts)
-- document symbol default method search
keymap("n", "<leader>ds", "<cmd>lua require('telescope.builtin').lsp_document_symbols({symbols={'class', 'constructor', 'function', 'method'}}) <CR>", opts)
-- nvim-tree-toggle
-- keymap("n", "<leader>n", ":CHADopen<CR>", opts)
keymap("n", "<leader>n", ":Telescope file_browser <CR>", opts)

-- global search replace
keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)

-- Ag search
-- testing out grep_string again for this
-- map("n", "<leader>'", ":Ag <C-R><C-W><CR>")

-- hop
keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})

-- bufonly
keymap("n", "<leader>x", ":BufOnly <CR>", opts)
keymap("n", "<leader>q", ":Bclose! <CR>", opts)

-- Search for text within buffers
keymap("n", "<leader>.", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true}) <CR>", opts)
-- map("n", "<leader>.", ":Lines<CR>")

-- spacebar saves
keymap("n", "<space>", ":w<CR>", opts)

-- v vertical split
keymap("n", "<leader>v", ":vs<CR>", opts)
-- s split
keymap("n", "<leader>s", ":sp<CR>", opts)

-- trouble toggle
keymap("n", "tt", ":TroubleToggle<CR>", opts)

-- delete logs console.log lines
keymap("n", "<leader>dl", ":g/console.log/d<CR>", opts)

-- lsp diagnostics toggle
-- keymap("n", "tt", ":ToggleDiag<CR>", opts)

-- gitsigns
keymap("n", "<leader>b", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", opts)
keymap("n", "<leader>bl", ":Gitsigns toggle_current_line_blame<CR>", opts)
keymap('n', '<leader>bs', ":Git blame<cr>", { noremap = true, silent = true })


-- format
keymap("v", "fg", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

keymap("n", ",h", ":wincmd h<CR>", opts)
keymap("n", ",j", ":wincmd j<CR>", opts)
keymap("n", ",k", ":wincmd k<CR>", opts)
keymap("n", ",l", ":wincmd l<CR>", opts)
