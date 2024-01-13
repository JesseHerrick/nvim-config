local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		-- ['<Tab>'] = cmp_action.luasnip_supertab(),
		-- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'codeium' }
	}
})
