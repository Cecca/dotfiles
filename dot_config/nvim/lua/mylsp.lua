local wk = require('which-key')

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Actions/documentation
  wk.register({
    name = 'LSP Actions',
    r = { vim.lsp.buf.rename, '[R]ename' },
    u = { require('telescope.builtin').lsp_references, 'References ([U]sages)' },
    a = { vim.lsp.buf.rename, 'Code [A]ction' },
    d = { vim.lsp.buf.hover, 'Hover Documentation' },
    D = { vim.lsp.buf.signature_help, 'Signature help' },
    s = { require('telescope.builtin').lsp_document_symbols, 'Document symbols' },
    S = { require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols' },
  }, {prefix = "<leader>l"})

  -- Workspacce
  wk.register({
    name = 'LSP Workspace',
    a = {vim.lsp.buf.add_workspace_folder, 'Workspace add folder'},
    r = {vim.lsp.buf.remove_workspace_folder, 'Workspace remove folder'},
    l = {function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders'}
  }, {prefix = "<leader>lw"})


  -- Movement
  wk.register({
    d = { vim.lsp.buf.definition, 'Go to definition' },
    D = { vim.lsp.buf.definition, 'Go to declaration' },
    t = { vim.lsp.buf.type_definition, 'Go to type definition' },
    i = { vim.lsp.buf.definition, 'Go to implementation' },
    r = { require('telescope.builtin').lsp_references, 'Symbol references' }
  }, {prefix = 'g'})

  -- TODO: replace with a call to legendary
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'texlab', 'r_language_server' }

-- Ensure the servers above are installed
require('nvim-lsp-installer').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
         library = vim.api.nvim_get_runtime_file('', true) ,
         checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
            group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
            enable = true,
        },
      },
      checkOnSave = {
        -- default: `cargo check`
        command = "clippy"
      },
      procMacro = {
        enable = true
      }
    }
  }
}

