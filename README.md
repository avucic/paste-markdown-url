# paste-markdown-url

Neovim plugin to paste url into markdown.

## Requirements

- Python3

This plugin needs the followings python package.

```
$ pip3 install requests beautifulsoup4 lxml
```

## Install

For packer

```lua
    {
      "avucic/paste-markdown-url",
      run = "pip3 install requests beautifulsoup4 lxml",
      config = function()
        require("paste-markdown-url")
      end,
    },

```

Note: The followings Python dependencies will be installed.

- requests
- beautifulsoup4
- lxml

## Example

Copy the url (ex. https://www.google.com/) into clipboard, and run this command.

```
:PasteMDLink
```

The title of url is fetched and a link in markdown format is inserted.

```
[Google](https://www.google.com/)
```

## Credits

- https://github.com/sat0b/markdown-url-paste.nvim
- https://benjamincongdon.me/blog/2020/06/27/Vim-Tip-Paste-Markdown-Link-with-Automatic-Title-Fetching/
