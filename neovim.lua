-- Marathon-Light (Bungie 2026) — light theme
-- Uses tokyonight 'day' as the base, then overrides its palette to the
-- Marathon Light hexes: near-white background, sharp ink, Runner magenta
-- as primary accent. High-contrast modern minimalism — not warm editorial.

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "day",
			light_style = "day",
			transparent = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
			},
			on_colors = function(colors)
				-- Backgrounds — near-white, with subtle steps for panels
				colors.bg = "#FAFAFA"
				colors.bg_dark = "#F0F0F0"
				colors.bg_float = "#FFFFFF"
				colors.bg_highlight = "#EEEEEE"
				colors.bg_popup = "#FFFFFF"
				colors.bg_search = "#FFE0EF"
				colors.bg_sidebar = "#F2F2F2"
				colors.bg_statusline = "#EEEEEE"
				colors.bg_visual = "#FFD0E5"

				-- Foregrounds — sharp ink
				colors.fg = "#1F1F1F"
				colors.fg_dark = "#2D2D2D"
				colors.fg_float = "#1F1F1F"
				colors.fg_gutter = "#A0A0A0"
				colors.fg_sidebar = "#2D2D2D"

				colors.comment = "#3D3D3D"

				-- Primary accent — Runner signal magenta
				colors.magenta = "#EA027E"
				colors.magenta2 = "#C8025F"
				colors.purple = "#1100C8"
				colors.blue = "#1100C8"
				colors.blue0 = "#3601FB"
				colors.blue1 = "#1100C8"
				colors.blue2 = "#3601FB"
				colors.blue5 = "#1100C8"
				colors.blue6 = "#006B6B"
				colors.blue7 = "#006B6B"
				colors.cyan = "#006B6B"
				colors.teal = "#006B6B"
				colors.green = "#3F8800"
				colors.green1 = "#6BB300"
				colors.green2 = "#3F8800"
				colors.yellow = "#C04000"
				colors.orange = "#C04000"
				colors.red = "#D7003D"
				colors.red1 = "#EA027E"

				colors.border = "#B5B5B5"
				colors.border_highlight = "#EA027E"
			end,
			on_highlights = function(hl, c)
				hl.CursorLine = { bg = "#EEEEEE" }
				hl.CursorColumn = { bg = "#EEEEEE" }
				hl.Search = { bg = "#FFE0EF", fg = "#0A0A0A" }
				hl.IncSearch = { bg = "#EA027E", fg = "#FAFAFA" }
				hl.Visual = { bg = "#FFD0E5" }
			end,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-day",
		},
	},
}
