nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

autocmd BufNewFile *.tex 0r ~/.vim/templates/tex.skel
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype markdown map <F5> :silent !/usr/local/bin/pandoc "%" --pdf-engine /Library/TeX/texbin/pdflatex -V geometry:margin=1in -o "%:r.pdf" && open -a Skim "%:r.pdf"<CR><bar>:redraw!<CR>
autocmd Filetype markdown map <F6> :silent !/usr/local/bin/pandoc "%" --pdf-engine /Library/TeX/texbin/pdflatex --toc -V geometry:margin=1in -o "%:r.pdf" && open -a Skim "%:r.pdf"<CR><bar>:redraw!<CR>
autocmd Filetype haskell setlocal expandtab

set path+=**
set wildmenu
set number
set relativenumber
set background=dark 
set linebreak
set encoding=utf-8
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set noundofile
set wildignore+=*.aux,*.bbl,*.bcf,*.blg,*.fdb_latexmk,*.fls,*.run.xml,*.synctex.gz,*.toc
set mouse=a
set laststatus=2
set guifont=SourceCodePro+Powerline+Awesome:h12
set conceallevel=2
set inccommand=nosplit
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=number
syntax on

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
Plug 'vimwiki/vimwiki'
Plug 'neovimhaskell/haskell-vim'
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leanprover/lean.vim'

call plug#end() 

" let g:markdown_enable_folding = 1
let g:markdown_enable_conceal = 1
let g:vimtex_view_method = 'mupdf'

let g:airline_powerline_fonts = 1


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:vimwiki_list = [{'path': '~/nas-wiki/wiki', 'path_html': '~/nas-wiki/html'}]

let g:UltiSnipsExpandTrigger="<tab>"


let g:airline_theme='one'
colorscheme one
call one#highlight('PMenu', 'abb2bf', '', 'none')
