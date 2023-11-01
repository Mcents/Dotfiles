:imap jj <Esc>
let mapleader = " "
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
nmap <C-P> :FZF<CR>

"==============================THEME==================================
set termguicolors
syntax on
colorscheme gotham
set t_Co=256

"==============================TREE==================================
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"==============================PRY==================================
":ia pry require 'pry';binding.pry
:ia pry require IEx; IEx.pry

"==============================SPACING==================================
set shiftwidth=2
set tabstop=2
set expandtab

autocmd BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
	%s/[ \t]\+$//ge
	%s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun

"==============================BASIC==================================
filetype plugin indent on       " load file type plugins + indentation
nnoremap <C-B> <C-Z>
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
set mouse=a                     " enable mouse
:set noswapfile                 " swap file directory
set backspace=indent,eol,start  " backspace through everyt
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " default tab is two spaces
vnoremap <C-c> :w !pbcopy<CR><CR>
autocmd FileType gitcommit set nosmartindent | set formatoptions-=t

"==============================AUTOCOMPLETE==================================
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
nnoremap <C-J> <c-w><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",,"<CR>
inoremap ,; <C-n><C-r>=pumvisible()      ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",;"<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",:"<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",="<CR>

"==============================QUOTE/UNQUOTE==================================
nnoremap sq :silent! normal mpea"<Esc>bi"<Esc>`pl
nnoremap qs :silent! normal mpeld bhd `ph<CR>

"==============================YankingThangs==================================
xnoremap i% <esc>%:execute "normal! vi" . getline('.')[col('.')-1]<cr>
onoremap i% :execute "normal vi%"<cr>

"=============================FZF======================================
nnoremap <silent> <leader>/ :Ag<CR>

"==============================AIRLINE==================================
let g:airline_theme='gotham'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:gotham_airline_emphasised_insert = 0

"=============================TESTING==========================
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#elixir#exunit#executable = 'iex -S mix test'

"============================LS=====================
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <silent> gd <Plug>(coc-definition)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
