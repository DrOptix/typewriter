local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local clone = string.format(
		"git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable %s",
		lazypath
	)
	local checkout = string.format("git -C %s checkout d8f26ef", lazypath)
	local command = string.format("%s && %s", clone, checkout)

	vim.fn.system(command)
end

vim.opt.rtp:prepend(lazypath)

local imports = {
	{ import = "typewriter.plugins" },
	{ import = "typewriter.plugins.lsp" },
	{ import = "typewriter.plugins.dap" },
	{ import = "typewriter.plugins.themes" },
	{ import = "typewriter.plugins.fileman" },
	{ import = "typewriter.plugins.editor" },
}

require("lazy").setup(imports, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
