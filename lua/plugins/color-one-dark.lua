return {
	"navarasu/onedark.nvim" ,
	lazy = false,
	priority = 999,
	config = function()
        require('onedark').setup {
            style = 'dark'
        }
        require('onedark').load()
		vim.cmd('colorscheme onedark')
	end
}
