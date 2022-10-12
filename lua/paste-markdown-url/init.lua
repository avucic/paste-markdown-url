-- based on this https://benjamincongdon.me/blog/2020/06/27/Vim-Tip-Paste-Markdown-Link-with-Automatic-Title-Fetching/
local parse_url = function()
	local url = vim.fn.getreg('"')

	if url:match("^https?") == nil then
		vim.notify("clipboard content is not valid url", vim.log.levels.WARN)
		return
	end

	local handle = io.popen(
		"python3 -c \"import bs4, requests; print(bs4.BeautifulSoup(requests.get('"
			.. url
			.. "').content, 'lxml').title.text.strip())\" 2>&1"
	)

	if handle == nil then
		return
	end

	local title = handle:read("*a"):gsub("\n", "")
	-- todo error handling
	if string.match(title, ".*import") then
		vim.notify("clipboard content is not valid url")
	else
		local mdlink = "[" .. title .. "](" .. url .. ")"
		vim.cmd(vim.api.nvim_replace_termcodes("normal! a" .. mdlink .. "", true, true, true))
		handle:close()
	end
end

vim.api.nvim_create_user_command("PasteMDLink", parse_url, {})
