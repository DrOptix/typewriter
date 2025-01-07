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
	{ import = "me.plugins" },
	{ import = "me.plugins.lsp" },
	{ import = "me.plugins.dap" },
	{ import = "me.plugins.themes" },
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
