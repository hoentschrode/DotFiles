if !exists('g:lspconfig')
    finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua <<EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the languate server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K',  '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- Formatting
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

    require'completion'.on_attach(client, bufnr)

    protocol.CompletionItemKind = {
        '', -- Text
        '', -- Method
        '', -- Function
        '', -- Constructor
        '', -- Field
        '', -- Variable
        '', -- Class
        'ﰮ', -- Interface
        '', -- Module
        '', -- Property
        '', -- Unit
        '', -- Value
        '', -- Enum
        '', -- Keyword
        '﬌', -- Snippet
        '', -- Color
        '', -- File
        '', -- Reference
        '', -- Folder
        '', -- EnumMember
        '', -- Constant
        '', -- Struct
        '', -- Event
        'ﬦ', -- Operator
        '', -- TypeParameter
      }

end

-- Configure language servers (https://github.com/neovim/nvim-lspconfig)

-- For config details refer to: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
nvim_lsp.pyright.setup{
    on_attach = on_attach,
    filetypes = {"python"}
}

nvim_lsp.clangd.setup{
    on_attach = on_attach,
    filetypes = {"c", "cpp"},
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
    }
}

-- Refer to for details: https://github.com/iamcco/diagnostic-languageserver
nvim_lsp.diagnosticls.setup{
    on_attach = on_attach,
    filetypes = {"python", "css", "markdown"},
    init_options = {
        linters = {
            flake8 = {
                command = 'flake8',
                debounce = 100,
                args = {"--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s", "-"},
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "flake8",
                formatLines = 1,
                formatPattern = {
                    "(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$",
                    {
                        line = 1,
                        column = 2,
                        security = 3,
                        message = 4
                    }
                },
                securities = {
                    ["W"] = "warning",
                    ["E"] = "error",
                    ["F"] = "error",
                    ["C"] = "error",
                    ["N"] = "error"
                }
            }
        },
        filetypes = {
            python = "flake8"
        },
        formatters = {
            black = {
                command = 'black',
                args = {'--quiet', "-"}
            },
            prettier = {
                command = 'prettier',
                args = {'--stdin-filepath', '%filename'}
            }
        },
        formatFiletypes = {
            python = "black",
            css = "prettier",
            markdown = "prettier"
        }
    }
}

-- Icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- Ths sets the spacing and thr prefix
        virtual_text = {
            spacing = 4,
            prefix = ' ' 
        }
    }
)

EOF
