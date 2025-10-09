local M = {
	'williamboman/mason.nvim',
	dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvim-lua/plenary.nvim',
	},
}

M.servers = {
	"lua_ls",
	"rust_analyzer",
	"clangd"
}

function M.config()

	local lsp = require("lsp-zero")
	lsp.preset("recommended")
	
	require("lsp-zero").setup()
	require("mason").setup()
	
	require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls"}
	}
	
	require("mason-lspconfig").setup {
      ensure_installed = M.servers,
      automatic_installation = true,
	}

end

return M
