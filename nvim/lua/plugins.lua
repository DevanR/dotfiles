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
lspconfig.ts_ls.setup{}

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

-- Autopairs configuration
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
  disable_in_macro = false,
  disable_in_visualblock = false,
  ignored_next_char = [=[[%w%%%'%[%"%.]]=],
  enable_moveright = true,
  enable_afterquote = true,
  enable_check_bracket_line = true,
  enable_bracket_in_quote = true,
})
