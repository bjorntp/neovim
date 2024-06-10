local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

-- Function to return today's date
local function today_date()
  return os.date("%Y-%m-%d") -- change format as needed
end

-- Define the snippet
ls.add_snippets("all", {
  s("today", {
    f(today_date, {}) -- inserts today's date
  }),
})
