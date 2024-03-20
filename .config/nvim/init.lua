vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])

require("core")
require("setup")

vim.filetype.add({
	filename = {
		[".luacheckrc"] = "", -- Remove the lua filetype
	},
})

vim.defer_fn(function()
	vim.cmd([[
      syntax on
      filetype on
      filetype plugin indent on
  ]])
end, 0)
