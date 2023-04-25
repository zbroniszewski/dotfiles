return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    virtual_lines = {
      only_current_line = true,
    },
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,
    setup_handlers = {
      bashls = function(_, opts)
        local filename = vim.fn.expand("%:t")
        if not (filename == ".env") then
          require("lspconfig")["bashls"].setup(opts)
        end
      end,
    },
    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      yamlls = {
        -- override table for require("lspconfig").yamlls.setup({...})
        settings = {
          yaml = {
            schemas = {
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/*.{yml,yaml}",
            },
          },
        },
      },
      ansiblels = {
        -- override table for require("lspconfig").ansiblels.setup({...})
        settings = {
          ansible = {
            validation = {
              lint = {
                enabled = false,
              },
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      tailwindcss = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("tailwind.config.js")
        return opts
      end,
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          -- "matchparen",
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    vim.filetype.add({
      extension = {
        tf = "terraform",
      },
      filename = {
        [".env"] = "env",
      },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
    })

    local function yaml_ft(path, bufnr)
      -- get content of buffer as string
      local content = vim.filetype.getlines(bufnr)
      if type(content) == "table" then
        content = table.concat(content, "\n")
      end

      -- check if file is in roles, tasks, or handlers folder
      local path_regex = vim.regex("(tasks\\|roles\\|handlers)/")
      if path_regex and path_regex:match_str(path) then
        return "yaml.ansible"
      end
      -- check for known ansible playbook text and if found, return yaml.ansible
      local regex = vim.regex("hosts:\\|tasks:")
      if regex and regex:match_str(content) then
        return "yaml.ansible"
      end

      -- return yaml if nothing else
      return "yaml"
    end

    vim.filetype.add({
      extension = {
        yml = yaml_ft,
        yaml = yaml_ft,
      },
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    augroup("lsp_highlights", { clear = true })

    autocmd("LSPAttach", {
      desc = "Fix LSP semantic highlights",
      group = "lsp_highlights",
      pattern = "*",
      callback = function(args)
        -- -- local bufnr = args.buf
        -- local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- if client.name ~= "terraformls" then
        --   return
        -- end
        -- vim.api.nvim_set_hl(0, "@lsp.type.variable.terraform", {})
      end,
    })
  end,
}
