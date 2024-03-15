return {
	compiler = {},

	build = {
		{ verbose = true,           atomic = true },
		{ "fnl/**/*.fnl",           true },
		{ "after/plugin/fnl/*.fnl", true }
	},

	-- clean = {
	-- 	{ "after/plugin/lua/*.lua", false },
	-- 	{ "lua/*.lua",              false },
	-- 	{ "after/plugin/fnl/*.lua", true },
	-- 	{ "fnl/*.lua",              true }
	-- },
}
