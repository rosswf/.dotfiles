--vim.api.nvim_create_autocmd("BufWritePre", {
--    pattern = "*",
--    callback = function()
--        vim.lsp.buf.format()
--    end
--})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, "utf-8")
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
        vim.lsp.buf.format()
	end,
})

vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

