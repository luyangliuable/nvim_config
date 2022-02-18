:set number
:set relativenumber
:set textwidth=80
:set wrap linebreak nolist
:set clipboard=unnamed

call plug#begin('~/.config/nvim/plugged')
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/nvim-orgmode/orgmode' " Vim orgmode
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/wting/autojump'  " Auto jump
Plug 'https://github.com/sainnhe/everforest'  " Everforest theme
Plug 'karb94/neoscroll.nvim'
" Orgmode
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

Plug 'akinsho/toggleterm.nvim' " Terminal
Plug 'TimUntersberger/neogit' " magit clone for nvim, depends on plenary
Plug 'nvim-lua/plenary.nvim' " plenary
Plug 'easymotion/vim-easymotion' " Easily jumping around places
Plug 'ahmedkhalf/jupyter-nvim', { 'do': ':UpdateRemotePlugins' } " Jupyter notebooks
call plug#end()

set encoding=UTF-8

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nmap oo o<Esc>k

" Tabs
nnoremap <C-i>l :tabnext<CR>
nnoremap <C-i>h :tabprevious<CR>
nnoremap <C-i>x :tabclose<CR>
nnoremap <C-i> :tabnew<CR>
map <Space>0 0gt
map <Space>1 1gt
map <Space>2 2gt
map <Space>3 3gt
map <Space>4 4gt
map <Space>5 5gt
map <Space>6 6gt
map <Space>7 7gt
map <Space>8 8gt
map <Space>9 9gt

" Utility
nnoremap <Space>ft :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Space>fed :PlugInstall<CR>

"MAGIT
nnoremap <Space>gs :Neogit<CR>

" Terminal
nnoremap <Space>p$ :spl<CR><C-W>j:terminal<CR>
nnoremap <Space>p# :ToggleTerm direction=float<CR>

"Buffer
nnoremap <Space>bx :clo<CR>
nnoremap <Space>bd :bd<CR>

nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <Space>xJ ddp<Space>x
nmap <Space>xK ddkkp<Space>x

"Windows
nnoremap <Space>wm :only<CR>
nmap <Space>wL <C-w>L
nmap <Space>wH <C-w>H
nmap <Space>wJ <C-w>J
nmap <Space>wK <C-w>K
nmap <Space>bY mpggVGy`p
nnoremap <Space>wv :vsplit<CR>
nnoremap <Space>ws :split<CR>
nnoremap <Space>wV :vsplit<CR><C-w>l
nnoremap <Space>wS :split<CR><C-w>j

nmap <Esc> <C-\><C-n>
nmap <Space>;; gcc
nmap <Space>wj <C-w>j<Space>w
nmap <Space>wk <C-w>k<Space>w
nmap <Space>wh <C-w>h<Space>w
nmap <Space>wl <C-w>l<Space>w
nmap <C-j> ko<Esc>j
" nmap <C-J> <C-W>j<C-W>
" nmap <C-K> <C-W>k<C-W>
" nmap <C-H> <C-W>h<C-W>
" nmap <C-L> <C-W>l<C-W>
nmap <F8> :TagbarToggle<CR>
" nmap <C--> <C-W>-<C-W>
" nmap <C-+> <C-W>+<C-W>


" color toggle
function! ToggleLightMode()
	echo &background
	if &background =~ "dark"
		:set background=light
	else
		:set background=dark

	endif
	endfunction
nnoremap <Space>Tn :call ToggleLightMode()<CR>


" line toggle
function! ToggleLineMode()
	echo &relativenumber
	if &relativenumber =~ 1
		:set norelativenumber
		:set number
	else
		:set number relativenumber
	endif
	endfunction
nnoremap <Space>tn :call ToggleLineMode()<CR>


" :colorscheme OceanicNext
" :colorscheme challenger_deep
" :colorscheme happy_hacking
:colorscheme Everforest
:set background=light

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

set guifont=:h
set guifont=DroidSansMono\ Nerd\ Font:h11

" air-line
let g:airline_powerline_fonts = 1

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE


" Smooth scrolling
lua << EOF
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '150', [['sine']]}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '150', [['sine']]}}
-- Use the "circular" easing function
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '369', [['circular']]}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '369', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-y>'] = {'scroll', {'-0.10', 'false', '69', nil}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '69', nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)
EOF

" Config for easymotion
" <Leader>f{char} to move to {char}
map  <Space>jw <Plug>(easymotion-bd-f)
nmap <Space>jw <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Space>jj <Plug>(easymotion-overwin-f2)

