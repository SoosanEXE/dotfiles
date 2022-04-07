"BASIC CONFIG{{{
    syntax on
    set t_u7=
    set relativenumber
    set nu
    set noerrorbells
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set nowrap
    set incsearch
    set nocompatible
    set scrolloff=8
    set signcolumn=no
    set cmdheight=2
    set cursorline
    set autoindent
    set smartcase
    set backspace=indent,eol,start
    set ruler
    set spelllang=en_us
    set mouse=a
    set signcolumn=number
    set termguicolors
    set hidden 
    set encoding=utf-8 
    set wildmode=longest,list,full 
    set belloff=all 
    let mapleader= " "
    set foldenable
    set foldmethod=marker
    set foldmarker={{{,}}}
"}}}
"KEEP CENTERED {{{
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap J mzJ`z
"}}}
"MOVING LINES  {{{
"with J and K in visual mode
"<space> k and j in normal mode
    vnoremap K :m '<-2<CR>gv=gv
    vnoremap J :m '>+1<CR>gv=gv
    inoremap <C-k> <esc>:m .-2<CR>==
    inoremap <C-j> <esc>:m .+1<CR>==
    nnoremap <leader>k :m .-2<CR>==
    nnoremap <leader>j :m .+1<CR>==
"reselects when indenting 
    vnoremap > >gv
    vnoremap < <gv
"}}}
"VIM-PLUG{{{
    "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "sudo apt install nodejs npm
    "check node version for Coc
    "node needs to be >12.12 
    "sudo apt install clangd
    "CocInstall coc-clangd coc-java
    call plug#begin('~/.vim/plugged')
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'preservim/nerdtree'
        Plug 'jiangmiao/auto-pairs'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'morhetz/gruvbox'
        Plug 'uiiaoo/java-syntax.vim'
        Plug 'junegunn/goyo.vim'
        Plug 'voldikss/vim-floaterm'
        Plug 'ryanoasis/vim-devicons'
        Plug 'ghifarit53/tokyonight-vim'
        Plug 'greyblake/vim-preview'
        Plug 'joshdick/onedark.vim'
    call plug#end()
"}}}
"NERD TREE CONFIG {{{
"<space> r to refresh
"<ctrl>t to toggle the tree
"<ctrl>f to show the current file in the tree
    nnoremap <silent><leader>n :NERDTreeFocus
    nnoremap <silent><C-n> :NERDTree<CR>
    nnoremap <silent><C-t> :NERDTreeToggle<CR>
    nnoremap <silent><C-f> :NERDTreeFind<CR>
    "Start nerd tree automatically
    "uncomment the following 2 lines if u want to show the tree when u open vim
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"}}}
"COC CONFIG{{{
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    nnoremap <silent>K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    set shortmess+=c

    nnoremap <leader>rn <Plug>(coc-rename)
    nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
"}}}
"THEME AND AIRLINE{{{
    set background=dark
    colorscheme gruvbox
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline_exclude_preview = 1
"}}}
"FZF CONFIG{{{
    let g:fzf_layout={'window': { 'width': 0.8, 'height': 0.8 } }
    let $FZF_DEFAULT_OPTS='--reverse'
    "FZF Buffer Delete
    function! s:list_buffers()
      redir => list
      silent ls
      redir END
      return split(list, "\n")
    endfunction

    function! s:delete_buffers(lines)
      execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
    endfunction

    command! BD call fzf#run(fzf#wrap({
      \ 'source': s:list_buffers(),
      \ 'sink*': { lines -> s:delete_buffers(lines) },
      \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
    \ }))

    "noremap <silent> <leader>pp :Files<CR>
    nnoremap <silent> <C-p> :Files<CR>
    "<leader>bd to open the fzf way to delete buffers
    nnoremap <silent> <leader>bd :BD<CR>
    "<leader>bb to open buffers and search for them
    nnoremap <silent><leader>bb :Buffers<CR>
    nnoremap <silent><leader>bw :Windows<CR>
"}}}
"SPLITS AND TABS{{{
    set splitright splitbelow 
    "keybinds to change between windows in NORMAL mode
    noremap <silent> <C-h> <C-w>h
    noremap <silent> <C-j> <C-w>j
    noremap <silent> <C-k> <C-w>k
    noremap <silent> <C-l> <C-w>l

    "split pane resize key bindings
    noremap <silent> <C-left> :vertical resize -2<CR>
    noremap <silent> <C-Right> :vertical resize +2<CR>
    noremap <silent> <C-Up> :resize +2<CR>
    noremap <silent> <C-Down> :resize -2<CR>

    "switch between buffers
    nmap <silent><Tab> :bn<CR>
    nmap <silent><S-Tab> :bp<CR>
"}}}
"CURSOR CONFIG{{{
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q" 
"}}}
"GOYO CONFIG{{{
    nmap  <silent><leader>\ :Goyo<CR>
"}}}
"TMUX CONF{{{
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"}}}
"CLIPBOARD{{{
    vnoremap <silent><leader>y :%w !xclip -i -sel c <CR><CR>
"}}}
"" replace selected with yanked stuff
    vnoremap <leader>p "_dp
    "space vr to open vimrc and space vs to source vimrc
    nnoremap <silent><leader>vr :e ~/.vimrc<CR>
    nnoremap <leader>vs :so ~/.vimrc<CR>
    "remap Y to yanking till end of line
    nnoremap Y y$
    "open terminal with <space>t
    nnoremap <leader>t :FloatermToggle<CR>

