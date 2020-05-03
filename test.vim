call plug#begin('/tmp/plugged')
    Plug 'neovim/nvim-lsp'
    Plug 'haorenW1025/completion-nvim'
call plug#end()

lua << EOF
local nvim_lsp = require 'nvim_lsp'
local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'
local lsp = vim.lsp

configs.phpls = {
  default_config = {
    cmd = {"php", "-d", "memory_limit=256M", "./phpls"};
    filetypes = {"php"};
    root_dir = util.root_pattern("composer.lock", ".git");
    log_level = lsp.protocol.MessageType.Warning;
    settings = {};
  };
}

nvim_lsp.phpls.setup{on_attach=require'completion'.on_attach}
EOF

au Filetype php setl omnifunc=v:lua.vim.phpls.omnifunc

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
