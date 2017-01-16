"if &compatible
""  set nocompatible
"end
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle 'christoomey/vim-run-interactive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'croaky/vim-colors-github'
Bundle 'danro/rename.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'scrooloose/syntastic'
Bundle 'slim-template/vim-slim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/tComment'
Bundle "mattn/emmet-vim"
Bundle "scrooloose/nerdtree"
Bundle "Lokaltog/vim-powerline"
Bundle "godlygeek/tabular"
Bundle "msanders/snipmate.vim"
Bundle "jelera/vim-javascript-syntax"
Bundle "altercation/vim-colors-solarized"
Bundle "othree/html5.vim"
Bundle "xsbeats/vim-blade"
Bundle "Raimondi/delimitMate"
Bundle "groenewege/vim-less"
Bundle "evanmiller/nginx-vim-syntax"
Bundle "Lokaltog/vim-easymotion"
Bundle "tomasr/molokai"
Bundle "klen/python-mode"
Bundle "nathanaelkane/vim-indent-guides"
Plugin 'Yggdroot/indentLine'                "垂直缩进对齐线
Plugin 'mileszs/ack.vim'
Bundle 'jnwhiteh/vim-golang'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

filetype on

nmap <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.svn$','\.bak$']

set encoding=utf-8
set fileencodings=utf-8,gbk,default,latin1

set number          "显示行号
set expandtab       "编辑时将所有 Tab 替换为空格
set shiftwidth=4    "自动缩进的时候，缩进尺寸为4个空格
set tabstop=4       "设置 softtabstop 为 4. 输入 tab 后就跳了4格
set autoindent      "设置自动缩进
"对于不同类型的文件，进行自定义设置
"au FileType html,python,vim,javascript,css setl shiftwidth=2
"au FileType html,python,vim,javascript,css setl tabstop=2
"au FileType java,php setl shiftwidth=4
"au FileType java,php setl tabstop=4
"
set textwidth=80    "设置每行的最大字符数，超过的话，将换行
set colorcolumn=+1

set hlsearch        "搜索时高亮显示 
set incsearch       "输入搜索内容时就显示搜索结果
set fileformat=unix "文本格式
set nobackup        "覆盖文件时不备份
"
set ruler           "打开状态栏标尺
set laststatus=2    "显示状态栏 (默认值为 1, 无法显示状态栏)
set cmdheight=1     "设定命令行的行数为 1
"
set showtabline=1   "显示tab标签
set tabline+=%f     "tab标签
"" Enable Code Folding
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"                            " 用空格键来开关折叠
set foldmethod=syntax
set mouse=a         "任何情况都可以使用鼠标）
syntax on

"去掉错误声音
"set vb t_vb=
""工作目录随文件变
autocmd BufEnter * cd %:p:h
"设置状态栏
set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\%p%%\ \ \ [\ %L\ lines\ in\ all\ ]
highlight StatusLine guibg=SlateBlue guifg=Yellow
highlight StatusLineNC guibg=Gray guifg=White
au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
au InsertLeave * hi StatusLine guibg=Yellow guifg=SlateBlue gui=none

""不显示工具条
set guioptions-=T
set backspace=indent,eol,start "不设定的话在插入状态无法用退格键和 Delete
filetype on        "设置文件类型的检测
filetype plugin on "为特定的文件类型允许插件文件的载入

"按住ctrl键，移动方向键时，以峰驼的方式
"nnoremap <silent><C-Left>  :<C-u>cal
"search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
"nnoremap <silent><C-Right> :<C-u>cal
"search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
"inoremap <silent><C-Left>  <C-o>:cal
"search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
"inoremap <silent><C-Right> <C-o>:cal
"search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR> 
"
""php语法检查
setlocal makeprg=\/usr/bin/php\ -l\ -n\ -d\ html_errors=off\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd BufWritePost *.php,*.phps :make
"map :w:noh:make
"
""Disable phpsyntax based indenting for .php files
au BufRead,BufNewFile *.php             set indentexpr= | set smartindent
au BufRead,BufNewFile *.phps            set filetype=php

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 主动调用补全
let g:ycm_key_invoke_completion = '<C-a>'

"let g:indentLine_noConcealCursor = 1
"let g:indentLine_color_term = 0
"let g:indent_guides_auto_colors = 0 
"let g:indent_guides_guide_size = 1 
"let g:indent_guides_start_level = 2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd  guibg=white   ctermbg=3
"hi IndentGuidesEven guibg=lightgrey ctermbg=4
"
"颜色主题
"kai_original = 1
""colorscheme molokai
"colorscheme solarized
let g:molokai_original = 1
"colorscheme molokai
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE

nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F3> :Tagbar<CR>
autocmd BufReadPost *.php,*.go,*.py,*.hpp,*.cc,*.cxx call tagbar#autoopen()
""如果是c语言的程序的话，tagbar自动开启

map <F4> :Ack -i<CR>

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}
