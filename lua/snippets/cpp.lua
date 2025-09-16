local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
  s("ocf", {
    -- Class declaration
    t("class "), i(1, "ClassName"), t({" {", "\tprivate:", ""}),

    -- Members placeholder
    t({"\tpublic:\t"}),

    -- Default constructor
    t({"", "\t\t"}), rep(1), t("();"), t({"", ""}),

    -- Copy constructor
    t("\t\t"), rep(1), t("(const "), rep(1), t(" &other);"), t({"", ""}),

    -- Copy assignment operator
    t("\t\t"), rep(1), t("& operator=(const "), rep(1), t(" &other);"), t({"", ""}),

    -- Destructor
    t("\t\t~"), rep(1), t("();"), t({"", "};"}),
  }),
}

