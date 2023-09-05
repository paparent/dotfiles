vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = { source = 'always' }
});

local root_pattern = require('lspconfig.util').root_pattern

lsp.configure('tailwindcss', {
  root_dir = root_pattern(
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.ts'
  )
});

require'lspconfig'.volar.setup{
    filetypes = {'typescript', 'javascript', 'vue', 'json'}
}

