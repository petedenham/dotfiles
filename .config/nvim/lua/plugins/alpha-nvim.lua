return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"         ASOS         ",
			"     Peter Denham     ",
			"Lead Software Engineer",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC sf", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC sg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC sr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		local function footer()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100) / 100

			local total_plugins = stats.loaded
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return datetime .. "   " .. total_plugins .. " plugins loaded in " .. ms .. nvim_version_info
		end

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "Constant"

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
