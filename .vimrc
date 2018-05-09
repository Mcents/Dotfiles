syntax on
:imap jj <Esc>
execute pathogen#infect()
let mapleader = " "

autocmd BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
	%s/[ \t]\+$//ge
	%s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun

set background=dark
"colorscheme deus
let g:airline_theme='deus'

let NERDTreeShowHidden=1

"shortcut for adding require ‘pry’;binding.pry
:ia pry require 'pry';binding.pry

"copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

autocmd FileType gitcommit set nosmartindent | set formatoptions-=t


set backspace=indent,eol,start                                   " backspace through everyt
set nowrap                                                       " don't wrap lines
set tabstop=2 shiftwidth=2                                       " default tab is two spaces

" Basic editor behaviour
filetype plugin indent on       " load file type plugins + indentation
nnoremap <C-B> <C-Z>
set t_Co=256                    " Explicitly tell vim that the terminal supports 256 colors
syntax enable                   " highlighting and shit
set cursorline                  " colours the line the cursor is on
set scrolloff=4                 " adds top/bottom buffer between cursor and window
set number                      " line numbers
set showcmd                     " display incomplete commands
set autoread                    " Auto-reload buffers when file changed on disk
set noshowmode                  " Get rid of default mode indicator
set autoindent                  " Set auto indent
set ts=2                        " Set indent to 2 spaces
set relativenumber              " Show relative line numbers
set vb                          " enable visual bell (disable audio bell)
set clipboard=unnamed           " use system clipboard
set mouse=a

autocmd vimenter * NERDTree

"Auto Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

nnoremap <C-J> <c-w><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


nnoremap <Leader>q" ciw""<Esc>P                                   " put double qunote around word
nnoremap <Leader>q' ciw''<Esc>P                                   " put single quotes around word

:set noswapfile

" RSpec.vim mappings
let g:rspec_command = '!bundle exec rspec {spec}'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Hack\ for\ Powerline:h15
    endif
endif
