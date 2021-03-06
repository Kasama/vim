syntax on

" Vundle and plugins "{

"" Autoinstall Vundle
let isVundleUpdated=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let isVundleUpdated=0
endif

"" Init Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

"" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'chrisbra/NrrwRgn'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'othree/xml.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'suan/vim-instant-markdown'
"" End Plugins

call vundle#end()
filetype plugin indent on
" Vundle Done

"" If Vundle was just installed, install all plugins
if isVundleUpdated == 0
	echo "Installing Plugins, please ignore key map error messages"
	echo ""
	:BundleInstall!
endif "}

" Leader key "{
let mapleader = ","
let localleader = ";"
"}

" Case insensitive :wq "{
command! W w
command! Q q
command! Wq wq
command! WQ wq "}

" Mappings "{
"" Consider long lines separate lines
nnoremap j gj
nnoremap k gk
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>

"" edit and source vimrc file
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv source $MYVIMRC<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>l

"" Using H and L as 0 and $
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

"" Spelling
nnoremap <silent> <leader>l :setlocal spell!<CR>

"" Create Fold
nnoremap <silent> <leader>f :set foldmethod=marker<CR>

"" jk in insert mode exits it
inoremap jk <Esc>

"" NerdTree
nnoremap \ :NERDTreeToggle<CR>

"" Better Scrolling
nnoremap <C-J> <C-E>
nnoremap <C-K> <C-Y>

"" Tabs Commands
nnoremap <C-S><C-X> gt
nnoremap <C-S><C-Z> gT
"map <C-S><C-S> gT
nnoremap <C-S><C-W> :tabclose<CR>
nnoremap <C-S><C-O> :tabnew<CR>

"" Save current file
nnoremap <C-S> :w<CR>

"" Save as root
cmap w!! w !sudo tee % > /dev/null

"" Ident entire file
nnoremap <silent> <leader>= gg=G<C-O><C-O>

"}
" Bubble single lines "{
nmap <M-J> @=']e'<CR>
nmap <M-K> @='[e'<CR>

" Bubble multiple lines
vmap <M-K> [egv
vmap <M-J> ]egv "}

" Settings "{
set tags=./tags;
set laststatus=2
set noshowmode
set whichwrap=b,s,<,>,[,]
set background=dark
set hlsearch
set foldmarker={,}
set foldmethod=marker
set foldlevelstart=99
set smartindent
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set exrc
set secure
set nu
set relativenumber
set completeopt=menuone
"}

" AuGroups "{
augroup devHelp "{
	autocmd!
	au Filetype c nnoremap <silent> <buffer> <leader>k :! devhelp -s "<cword>" 2>/dev/null 1>&2 &<CR><CR>
augroup END "}

augroup htmlAbrrevs "{
	autocmd!
	autocmd BufNewFile,BufRead *.html iabbrev << &lt;
	autocmd BufNewFile,BufRead *.html iabbrev >> &gt;
augroup END "}

augroup syntaxes "{
	autocmd!
	au BufNewFile,BufRead *.asm setlocal syntax=icmc
augroup END "}

augroup customTabs "{
	autocmd!
	au BufNewFile,BufRead *.rb setlocal tabstop=2
	au BufNewFile,BufRead *.rb setlocal shiftwidth=2
	au BufNewFile,BufRead *.rb setlocal softtabstop=2
	au BufNewFile,BufRead *.erb setlocal tabstop=2
	au BufNewFile,BufRead *.erb setlocal shiftwidth=2
	au BufNewFile,BufRead *.erb setlocal softtabstop=2
augroup END "}

augroup comments "{
	autocmd!
	au BufNewFile,BufRead *.c nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
	au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
	au BufNewFile,BufRead *.js nnoremap <silent> <buffer> <leader>q I//<esc>:s/\v(\/\/+)\1+//e<CR>
	au BufNewFile,BufRead *.rb nnoremap <silent> <buffer> <leader>q I#<esc>:s/\v(#+)\1+//e<CR>
	au BufNewFile,BufRead *.py nnoremap <silent> <buffer> <leader>q I#<esc>:s/\v(#+)\1+//e<CR>
	au Syntax vim nnoremap <silent> <buffer> <leader>q I"<esc>:s/\v("+)\1+//e<CR>
augroup END "}

augroup JavaEclim "{
	autocmd!
	au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>o :JavaImportOrganize<CR>
	au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>gi :JavaSearch<CR>
	au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>c :JavaCorrect<CR>
	au BufNewFile,BufRead *.java nnoremap <silent> <buffer> <leader>i :JavaImpl<CR>
augroup END "}

augroup PlantUML "{
	autocmd!
	au BufNewFile,BufRead *.uml setlocal syntax=plantuml
	au BufNewFile,BufRead *.puml setlocal syntax=plantuml
	au BufNewFile,BufRead *.puml nnoremap <silent> <leader>w :!plantuml -tsvg %<CR><CR>
augroup END "}

augroup VimRC "{
	autocmd!
	autocmd! BufWritePost *vimrc source %
augroup END "}

augroup commitSpell "{
	" Git commits.
	autocmd FileType gitcommit setlocal spell
augroup END "}

"}

" Enable mouse "{
if has('mouse')
	set mouse=a
endif "}

" Plugin related configs "{
"Eclim on supertab "{
let g:SuperTabDefaultCompletionType = 'context'
"}

"CtrlP configs "{
let g:ctrlp_map = '<leader>p'
" disable caching
let g:ctrlp_use_caching=0
"}

"Ultisnips using tab to expand "{
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
"}

"Disable default assembly checker "{
let g:syntastic_disabled_filetypes=['asm']
"}
"}

"" Functions {
function! s:Move(cmd, count, map) abort
	normal! m`
	silent! exe 'move'.a:cmd.a:count
	norm! ``
	silent! call repeat#set("\<Plug>unimpairedMove".a:map, a:count)
endfunction

function! s:MoveSelectionUp(count) abort
	normal! m`
	silent! exe "'<,'>move'<--".a:count
	norm! ``
	silent! call repeat#set("\<Plug>unimpairedMoveSelectionUp", a:count)
endfunction
function! s:MoveSelectionDown(count) abort

	normal! m`
	norm! ``
	exe "'<,'>move'>+".a:count
	silent! call repeat#set("\<Plug>unimpairedMoveSelectionDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'Down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>

nmap [e <Plug>unimpairedMoveUp
nmap ]e <Plug>unimpairedMoveDown
xmap [e <Plug>unimpairedMoveSelectionUp
xmap ]e <Plug>unimpairedMoveSelectionDown
"}

"" Highlights "{
" trailing whitespaces
" match ErrorMsg '\s\+$'
"}

"asdg
"aisjdiasjdsĸĸ̉̉̉̉̉̉̉ĸĸ̉ĸĸ̉ĸ̉ĸĸ eu nao acho que isso seja muito legal
"j
"k
"fasdfasdg
