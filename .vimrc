autocmd FileType * setlocal formatoptions-=cro
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" " 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" "去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
" "比较文件  
nnoremap <M-F2> :vert diffsplit % 
" "新建标签  
map <F4> :tabnew<CR>  
map <C-s> :w<CR> echo "saved"<CR>
"custom config
"let g:auto_save=1
set mouse=a
syntax on
colo skeletor
set nu
set confirm
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoread
set noswapfile
set cindent
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set background=dark	
set ruler
set showmatch
set clipboard+=unnamed 
set foldenable
nmap <leader>w :w!<cr>

nmap <leader>f :find<cr>

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "! ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "! ./%<"
        elseif &filetype == 'python'
            exec "!python %"
        elseif &filetype == 'java' 
            exec "!javac %" 
            exec "!java %<"
        elseif &filetype == 'sh'
            :!./%
        endif
endfunc



""python mode 配置 
" Python-mode
" " Activate rope
" " Keys: 按键：
" " K             Show python docs 显示Python文档
" " <Ctrl-Space>  Rope autocomplete  使用Rope进行自动补全
" " <Ctrl-c>g     Rope goto definition  跳转到定义处
" " <Ctrl-c>d     Rope show documentation  显示文档
" " <Ctrl-c>f     Rope find occurrences  寻找该对象出现的地方
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled) 断点
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" "            跳转到前一个/后一个类或函数
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
" "              跳转到前一个/后一个类或方法
let g:pymode_rope = 1
"
" " Documentation 显示文档
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" “Linting 代码查错，=1为启用
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" " Auto check on save
let g:pymode_lint_write = 1
"
" " Support virtualenv
"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = "/home/tan/anaconda3"

" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" " syntax highlighting 高亮形式
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code 禁用自动代码折叠
let g:pymode_folding = 0
let g:pymode_python = 'python3'
"""""""""""""""""设置折叠"""""""""""""""""""""
"
""根据语法折叠
set fdm=syntax
"手动折叠
""set fdm=manual
"设置键盘映射，通过空格设置折叠
"nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
"""""""""""""""""""""""""""""""""""""""""""""""
"vundle config
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/907th/vim-auto-save.git'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/skreek/skeletor.vim.git'
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/python-mode/python-mode.git'
Plugin 'https://github.com/vimlab/split-term.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
