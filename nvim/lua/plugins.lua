-- ~/.config/nvim/lua/plugins.lua

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "typescript", "bash", "lua", "vim" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

-- LSP Configuration
local lspconfig = require('lspconfig')

-- Python language server
lspconfig.pyright.setup{}

-- TypeScript/JavaScript language server
lspconfig.tsserver.setup{}

-- Bash language server
lspconfig.bashls.setup{}

-- Autocompletion
local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  }
})
