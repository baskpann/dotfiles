set tags=./tags;
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch
set noswapfile
set nobackup
set gdefault
set number
set showbreak=↪\
set listchars=tab:▸\ ,trail:·,eol:↲,extends:#,nbsp:·

set expandtab
set tabstop=2
set shiftwidth=2

colorscheme slate

let mapleader=","

" For taglist, have to specify exuberant-ctags instead of the ctags for
" emacs, which WSH is using as the default on the system
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

call plug#begin('$HOME/.vim/bundle')

Plug 'https://github.com/vim-scripts/taglist.vim.git', { 'on': 'TlistOpen' }
set laststatus=2
set t_Co=256
Plug 'https://github.com/vim-scripts/unmaze.vim', { 'for': 'c' }
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'r08ertliu/cscope-fzf'
Plug 'mellowcandle/vim-bitwise'
Plug 'wellle/context.vim'

call plug#end()

nnoremap <leader>f :TlistOpen<CR>:vertical resize 50<CR>
nnoremap \q :nohlsearch<CR>
nnoremap \Q :nohlsearch<CR>
nnoremap \p :setlocal paste!<CR>
"nnoremap <C-l> :FZF<CR>
nnoremap <C-l> :call FZFProjectRoot()<CR>
nnoremap <C-k> :Rg<Cr>
nnoremap <C-j> :Tags<Cr>
nnoremap <C-n> :Buffers<Cr>
vnoremap < <gv
vnoremap > >gv

" Macro To Do Today
nnoremap <leader>todo <esc>O<CR><esc>k"=strftime('## %F W%V %A')<CR>Pa<CR><CR>-

" Initialize configuration dictionary
let g:fzf_vim = {}
"let g:fzf_vim.preview_window = ['right,80%']

" Cscope
if has ("cscope")
	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	set cscopetag

	" Don't indicate success/failure messages
	set nocscopeverbose

	" 1 = check ctags for definition of a symbol before checking cscope
	" 0 = reverse
	set csto=1

	" add any cscope database in current directory
	" note: this is better than the autoload_cscope plugin because it allows 'vim -t {tag}' from the command line
	if filereadable("cscope.out")
		cs add cscope.out
		" else search up a few directories
	elseif filereadable("../cscope.out")
		cs add ../cscope.out
	elseif filereadable("../../cscope.out")
		cs add ../../cscope.out
	elseif filereadable("../../../cscope.out")
		cs add ../../../cscope.out
	elseif filereadable("../../../../cscope.out")
		cs add ../../../../cscope.out
	elseif filereadable("../../../../../cscope.out")
		cs add ../../../../../cscope.out
	elseif filereadable("../../../../../../cscope.out")
		cs add ../../../../../../cscope.out
	elseif filereadable("../../../../../../../cscope.out")
		cs add ../../../../../../../cscope.out
	elseif filereadable("../../../../../../../../cscope.out")
		cs add ../../../../../../../../cscope.out
	elseif filereadable("../../../../../../../../../cscope.out")
		cs add ../../../../../../../../../cscope.out
	elseif filereadable("../../../../../../../../../../cscope.out")
		cs add ../../../../../../../../../../cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
endif

" search from the git root if we're in a git repo
function! FZFProjectRoot()
    let project_root = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if strlen(project_root) > 0
        call fzf#run(fzf#wrap('FZFProjectRoot', {'dir': project_root}))
    else
        call fzf#run(fzf#wrap('FZFProjectRoot'))
    endif
endfunction
