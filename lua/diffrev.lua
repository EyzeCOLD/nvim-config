---@diagnostic disable:undefined-global

-- GIT DIFF IN NEOVIM WHOO
vim.api.nvim_create_user_command("DiffRev", function(opts)
	local rev = "HEAD"
	if opts.args ~= "" then
		rev = opts.args
	end
	local abs_file = vim.fn.expand("%:p")

	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		vim.notify("DiffRev: not in a git repository", vim.log.levels.ERROR)
		return
	end

	local rel_file = abs_file:sub(#git_root + 2) -- +2 to also strip the trailing slash

	local result = vim.fn.systemlist(
		"git show " .. vim.fn.shellescape(rev .. ":" .. rel_file)
	)
	if vim.v.shell_error ~= 0 then
		vim.notify(
			"DiffRev: git error: " .. table.concat(result, "\n"),
			vim.log.levels.ERROR
		)
		return
	end

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)

	local fake_name = vim.fn.fnamemodify(rel_file, ":t:r")
		.. "["
		.. rev
		.. "]."
		.. vim.fn.fnamemodify(rel_file, ":e")
	vim.api.nvim_buf_set_name(buf, fake_name)

	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].filetype = vim.bo.filetype
	vim.bo[buf].readonly = false

	vim.cmd("vert sbuffer " .. buf)
	vim.cmd("diffthis | wincmd p | diffthis")

	vim.api.nvim_create_autocmd("BufWinLeave", {
		buffer = buf,
		callback = function()
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(buf) then
					vim.api.nvim_buf_delete(buf, { force = true })
				end
			end)
		end,
	})
end, { nargs = "?" })

local function get_default_base_branch()
	local candidates = { "origin/main", "origin/master", "main", "master" }
	for _, ref in ipairs(candidates) do
		vim.fn.systemlist("git rev-parse --verify " .. ref)
		if vim.v.shell_error == 0 then
			return ref
		end
	end
	return nil
end

vim.keymap.set("n", "<leader>d", function()
	local ref = get_default_base_branch()
	if ref == nil then
		vim.notify(
			"DiffRev: could not find main or master",
			vim.log.levels.ERROR
		)
		return
	end
	vim.cmd("DiffRev " .. ref)
end, { desc = "Git diff against origin/main", silent = true })
