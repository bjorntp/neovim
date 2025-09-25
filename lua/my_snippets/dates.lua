local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function today_date() return os.date '%Y-%m-%d' end

ls.add_snippets('all', {
	s('today', {
		f(today_date, {}),
	}),
})
