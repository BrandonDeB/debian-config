local M = {
  'williamboman/mason.nvim',
}

M.servers = {
  "lua_ls",
  "rust_analyzer",
  "clangd",
  "vtsls",
  "pyright",
}

function M.config()
  local lsp_zero = require("lsp-zero")

  lsp_zero.extend_lspconfig()

  lsp_zero.on_attach(function(client, bufnr)
    -- Simple useful LSP keymaps
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end)

  -- Configure nvim-cmp for autocomplete
  local cmp = require('cmp')
  local cmp_action = lsp_zero.cmp_action()

  cmp.setup({
    sources = {
      {name = 'nvim_lsp'},
      {name = 'buffer'},
      {name = 'path'},
      {name = 'luasnip'},
    },
    mapping = cmp.mapping.preset.insert({
      -- Navigate between completion items
      ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

      -- Confirm selection
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<CR>'] = cmp.mapping.confirm({select = false}),

      -- Scroll documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      -- Toggle completion menu
      ['<C-e>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end),

      -- Navigate between snippet placeholders
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })

  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
    handlers = {
      lsp_zero.default_setup,
    }
  })

end

return M
