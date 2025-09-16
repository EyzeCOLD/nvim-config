local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function fn(
	args,
	parent,
	user_args
)
	return args[1][1] .. user_args
end

return {
	s("ifndef", {
		t("#ifned "), i(1), t({"", ""}),
		t("#define "), f(fn, {1}, { user_args = { "" }}), i(0),
		t({ "", "#endif" })
	})
}
