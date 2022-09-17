set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
require('impatient')
-- require'hop'.setup()

-- require("nvim-autopairs").setup()

-- require 'nvim-startup'.setup()

-- require("symbols-outline").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true
    },
    icons = {
      git_placement = "after",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        git = {
          untracked = "-",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})
vim.cmd [[highlight NvimTreeIndentMarker guifg=#58606d gui=nocombine]]
vim.cmd [[highlight NvimTreeImageFile guifg=#58606d gui=nocombine]]
vim.cmd [[highlight NvimTreeExecFile guifg=#58606d gui=nocombine]]

require'colorizer'.setup()

require('fzf-lua').setup{
  winopts = {
    height = 0.25,
    width = 1,
    row = 1,
    border = 'rounded',
  },
  buffers = {
    previewer = false,
    fzf_opts = {
      -- hide tabnr
      -- ['--delimiter'] = ":",
      -- ["--with-nth"]  = '1',
    }
  },
  oldfiles = {
    previewer = false,
  },
  fzf_colors = {
    ["fg"] = { "fg", "Normal" },
    ["bg"] = { "bg", "Normal" },
  },
}

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
vim.keymap.set({ "i", "s" }, "<c-n>", function() require'luasnip'.jump(1) end, { desc = "LuaSnip forward jump" })
vim.keymap.set({ "i", "s" }, "<c-p>", function() require'luasnip'.jump(-1) end, { desc = "LuaSnip backward jump" })

local cmp = require'cmp'
cmp.setup({
   formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<cr>"] = cmp.mapping.confirm({select = false}),
    -- ["<s-tab>"] = cmp.mapping.select_prev_item(),
    -- ["<tab>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 15},
    { name = 'buffer' , max_item_count = 15},
    { name = 'luasnip' },
    { name = 'path'},
  }) 
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' , max_item_count = 5}
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline', max_item_count = 10 },
    -- { name = 'path'}
  })
})


require('telescope').setup{
  defaults = {
    -- layout_config = {
      -- height = 10,
    -- },
  },
  pickers = {
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      winblend = 10,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  }
}
require("telescope").load_extension "file_browser"

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  },
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {"haskell"}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "gnn",
      -- node_incremental = "grn",
      -- scope_incremental = "grc",
      -- node_decremental = "grm",
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<tab>",
      node_decremental = "<BS>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        -- ["ac"] = "@class.outer",
        -- ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]m"] = "@class.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]M"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[m"] = "@class.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[M"] = "@class.outer",
      },
    },
  },
}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "pyright",
    "html",
    "cssls",
    "tsserver",
    "eslint",
    "sumneko_lua"
  },
  automatic_installation = true
})
mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      -- on_attach = require("shared").on_attach,
    }
  end
})

require'toggle_lsp_diagnostics'.init({ underline = false, virtual_text = false, signs = false})

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#707070 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#444444 gui=nocombine]]

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
    -- char = "┆",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
}

require('goto-preview').setup {
  width = 120; -- Width of the floating window
  height = 20; -- Height of the floating window
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
  default_mappings = false; -- Bind default mappings
  debug = false; -- Print debug information
  opacity = 0; -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = true; -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.

  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  focus_on_open = true; -- Focus the floating window when opening it.
  dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
}

-- local navic = require("nvim-navic")

-- require("lspconfig").pyright.setup {
    -- on_attach = function(client, bufnr)
        -- navic.attach(client, bufnr)
    -- end
-- }

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
}



-- require('dap-python').setup('/home/vll/venv_debugpy/debugpy/bin/python')
-- require('dap-python').setup('/Users/supasorn/debugpy/bin/python3')
-- require('dap').configurations.python = {}
-- table.insert(require('dap').configurations.python, {
  -- type = 'python',
  -- request = 'launch',
  -- name = 'My custom launch configuration',
  -- program = '${file}',
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
-- })

--[[
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        -- { id = "scopes", size = 0.25 },
        -- "breakpoints",
        {id = "stacks", size = 0.2},
        {id = "watches", size = 0.8}
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 20, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})
--]]

--[[
require("bufferline").setup{
  options = {
    sort_by = function(buffer_a, buffer_b)
      for _, buffer in ipairs(vim.fn.BufMRUList()) do
        if buffer == buffer_a.id then
          return true
        elseif buffer == buffer_b.id then
          return false
        end
      end
      return false
    end,
    numbers = function(opts)
      print(vim.inspect(opts))
      return string.format('%s.', opts.ordinal)
    end,
    -- numbers = 'ordinal'
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
--]]
-- require("scrollbar").setup()
EOF


