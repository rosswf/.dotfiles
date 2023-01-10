function ColorMyPencils(color)
    require("tokyonight").setup {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        }
    }


	color = color or "tokyonight"
	vim.o.background = "dark"
    vim.g.tokyonight_dark_float = false
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end

ColorMyPencils()
