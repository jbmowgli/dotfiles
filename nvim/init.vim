set nocompatible

" Initialize Vundle and load plugins (plugin manager)
" If vundle is not installed, do it first
call plug#begin()

" ----------------------------- BEGIN PLUGIN LIST ------------------------------

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'ngmy/vim-rubocop'
Plug 'tomtom/tcomment_vim'
Plug 'benmills/vimux'
  nnoremap <leader>a :autocmd BufWritePost * :VimuxRunLastCommand<CR>
  nnoremap <leader>x :autocmd! BufWritePost *<CR>
Plug 'pgr0ss/vimux-ruby-test'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
  let g:javascript_ignore_javaScriptdoc = 1
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
  let g:AutoPairsShortcutFastWrap = '<C-W>'
Plug 'tpope/vim-unimpaired'
  nmap <C-k> [e
  nmap <C-j> ]e
  vmap <C-k> [egv
  vmap <C-j> ]egv
  inoremap <C-j> <Esc>:m .+1<CR>==gi
  inoremap <C-k> <Esc>:m .-2<CR>==gi
Plug 'sukima/xmledit'
  let g:xmledit_enable_html=1
  function HtmlAttribCallback( xml_tag )
  endfunction
Plug 'ksmithbaylor/tomorrow-theme', {'rtp': 'vim/'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'KabbAmine/yowish.vim'

" ------------------------------ END PLUGIN LIST -------------------------------

" Finish initializing Vundle plugins
call plug#end()


if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax on
colorscheme tender

filetype off
filetype plugin indent on

compiler ruby

set t_Co=256
set autoread
set background=dark
set backspace=indent,eol,start
set dir=/tmp//
set foldmethod=manual
set foldlevelstart=20
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set hlsearch
set ignorecase
set incsearch
set linebreak
set number
set noshowmode
set pastetoggle=<F2>
set ruler
set scrolloff=5
set showmatch
set smartcase
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set laststatus=2
set ttimeoutlen=100 " handle timeout when exiting insert mode
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set wrap
set mouse=nicr

let g:ack_default_options = ' -s -H --nogroup --column --type-add ruby=.feature --ignore-dir=tmp'
let g:ackhighlight = 1
let g:ag_highlight = 1

let g:fuzzy_ignore = "*.log,tmp/*,db/sphinx/*,data"
let g:fuzzy_ceiling = 50000
let g:fuzzy_matching_limit = 10

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:no_html_toolbar = 'yes'

let g:rubycomplete_buffer_loading = 1

let g:signify_mapping_next_hunk = ']c'
let g:signify_mapping_prev_hunk = '[c'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'
let g:vimrubocop_extra_args = '--display-cop-names'


let coffee_no_trailing_space_error = 1

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let NERDTreeShowHidden=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <C-e> :NERDTreeToggle<CR>

let vimclojure#WantNailgun = 0
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setlocal textwidth=78

autocmd BufNewFile,BufRead *.txt setlocal textwidth=78
autocmd BufNewFile,BufRead *.cap setfiletype ruby
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufWritePre * :%s/\s\+$//e

" toggle relative number
function! ToggleRelativeNumber()
  if &relativenumber
    set number
  else
    set relativenumber
  endif
endfunction

imap <C-L> <SPACE>=><SPACE>
map <LocalLeader>aw :Ag! '<C-R><C-W>'
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>rt :!/usr/bin/ctags -R --exclude=".git\|.svn\|.idea\|log\|tmp\|db\|pkg" --extra=+f<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>tb :TagbarToggle<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <C-p> :CtrlP<CR>
map <silent> <LocalLeader>ft :CtrlPTag<CR>
map <silent> <LocalLeader>fb :CtrlPBuffer<CR>
map <silent> <LocalLeader>fr :CtrlPClearAllCache<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>yr :YRShow<CR>
map <silent> <LocalLeader>bd :bufdo :bd<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>
nnoremap <silent> <LocalLeader>rr :call ToggleRelativeNumber()<cr>
nnoremap <silent> <LocalLeader>ee :tabe $MYVIMRC<CR>
nnoremap <silent> <LocalLeader>ss :source $MYVIMRC<CR>
nnoremap <silent> <LocalLeader><CR> :tabe<CR>
nnoremap <silent> <LocalLeader>[ :tabp<CR>
nnoremap <silent> <LocalLeader>] :tabn<CR>
nnoremap <silent> <LocalLeader><Space> :noh<CR>
nnoremap <silent> <LocalLeader>ww :%s/\s\+$//<CR>:let @/=''<CR><C-o>
nnoremap <LocalLeader>ru :RuboCop<CR>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap <F1> <ESC>
inoremap jj <ESC>
nnoremap <silent> <LocalLeader>xx :!rm /tmp/**/*.swp<CR>
cnoremap <Tab> <C-L><C-D>
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev wA wa
cnoreabbrev Q q

map <silent> <LocalLeader>rb :wa<CR> :RunAllRubyTests<CR>
map <silent> <LocalLeader>rc :wa<CR> :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rf :wa<CR> :RunRubyFocusedTest<CR>
map <silent> <LocalLeader>rs :!ruby -c %<CR>
map <LocalLeader>rd Orequire 'ruby-debug';debugger<ESC>
setlocal isk+=?

let g:vimux_ruby_cmd_all_tests = 'bundle exec ruby'
let g:vimux_ruby_cmd_unit_test = 'bundle exec ruby'
let g:vimux_ruby_cmd_context = 'bundle exec ruby'

" treat wrapped lines as their own line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

if version >= 700
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
    autocmd FileType tex setlocal spell spelllang=en_us
endif

highlight clear SignColumn

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" highlight signs in Sy
highlight SignifySignAdd cterm=bold ctermfg=112
highlight SignifySignDelete cterm=bold ctermfg=1
highlight SignifySignChange cterm=bold ctermfg=39

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%9126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Comment colors
highlight Comment ctermfg=DarkMagenta
highlight Search ctermbg=LightBlue ctermfg=Black
highlight IncSearch ctermfg=Black

" http://techspeak.plainlystated.com/2009/08/vim-tohtml-customization.html
function! DivHtml(line1, line2)
  exec a:line1.','.a:line2.'TOhtml'
  %g/<style/normal $dgg
  %s/<\/style>\n<\/head>\n//
  %s/body {/.vim_block {/
  %s/<bods\(.*\)>\n/<div class="vim_block"\1>/
  %s/<\/body>\n<\/html>/<\/div>
  "%s/\n/<br \/>\r/g

  set nonu
endfunction
command! -range=% DivHtml :call DivHtml(<line1>,<line2>)

" ctrlp settings
nnoremap <silent> <LocalLeader>pp :CtrlP<CR>
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$\|log$\|tmp$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\|\.gem$\|\.tags$\|tags$\|\.png$\|\.gif$\|\.jpg$\|\.jpeg$\|\.bmp$\|\.tif$\|\.ico$',
    \ }
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 1
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 100
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_dont_split = 'NERD_tree_2'
call deoplete#enable()

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Re-highlight lines in visual mode after indent
:vnoremap < <gv
:vnoremap > >gv

