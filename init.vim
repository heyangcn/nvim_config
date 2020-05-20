"============基础配置============
syntax on
set cursorline "突出显示当前行
set showmatch " 显示括号匹配
set termguicolors
set number
set ts=2
set expandtab
set autoindent
"滚动时距离底部有6行
set scrolloff=6

"============tab 缩进============
set tabstop=2 " 设置Tab长度为4空格
set shiftwidth=2 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

set splitbelow

" 是否显示隐藏文件
let NERDTreeShowHidden=1

"set python path
"g:python3_host_prog="/Users/heyang/opt/anaconda3/bin/python"

" vim-plug
call plug#begin('~/.config/nvim/autoload/pluged')

"Use release branch (Recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'stephpy/vim-php-cs-fixer'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ap/vim-css-color'

"状态栏美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"语法检查和语义错误
Plug 'dense-analysis/ale'

"代码片段插件
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"自动闭合括号
Plug 'jiangmiao/auto-pairs'

"vim themes
Plug 'morhetz/gruvbox'

"版本控制插件
Plug 'mhinz/vim-signify'

"代码注释
Plug 'preservim/nerdcommenter'

"小程序开发插件
Plug 'chemzqm/wxapp.vim'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

"auto ctags 
"Plug 'ludovicchabant/vim-gutentags'

"目录文件树插件 catalog file tree plug
Plug 'preservim/nerdtree'

"vim-autopep8 自动格式化
Plug 'tell-k/vim-autopep8'

"Jedi-vim the function is also code completion 
"here assist ncm2,open method parameter reminder
Plug 'davidhalter/jedi-vim'


""ncm2 auto complete
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'HansPinckaers/ncm2-jedi'

 "do not forget to install jedi
Plug 'deoplete-plugins/deoplete-jedi'

"deoplete php 
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"deoplete go 
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

"deoplete javascript 
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_sources', {'php': ['omni']})
let g:deoplete#sources#go#gocode_binary = "/Users/heyang/mywork/go-project/bin/gocode"


" Set bin if you have many instalations
"let g:deoplete#sources#ternjs#tern_bin = '/path/to/tern_bin'
"let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'jquery',
                \ 'react',
                \ 'vue',
                \ '...'
                \ ]

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#manual_complete()


:nmap <space>e :CocCommand explorer<CR>

"弹窗显示结果
let g:Lf_WindowPosition = 'popup'

"搜索当前文件的方法
nmap <LEADER>o :LeaderfFunction<CR>

"vim themes config 
colorscheme gruvbox
set background=dark

"版本控制参数
let g:signify_vcs_list = ['git', 'svn']

 let g:user_emmet_settings = {
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \   },
  \  'default_attributes': {
  \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \     'navigator': [{'url': '', 'redirect': 'false'}],
  \     'scroll-view': [{'bindscroll': ''}],
  \     'swiper': [{'autoplay': 'false', 'current': '0'}],
  \     'icon': [{'type': 'success', 'size': '23'}],
  \     'progress': [{'precent': '0'}],
  \     'button': [{'size': 'default'}],
  \     'checkbox-group': [{'bindchange': ''}],
  \     'checkbox': [{'value': '', 'checked': ''}],
  \     'form': [{'bindsubmit': ''}],
  \     'input': [{'type': 'text'}],
  \     'label': [{'for': ''}],
  \     'picker': [{'bindchange': ''}],
  \     'radio-group': [{'bindchange': ''}],
  \     'radio': [{'checked': ''}],
  \     'switch': [{'checked': ''}],
  \     'slider': [{'value': ''}],
  \     'action-sheet': [{'bindchange': ''}],
  \     'modal': [{'title': ''}],
  \     'loading': [{'bindchange': ''}],
  \     'toast': [{'duration': '1500'}],
  \     'audio': [{'src': ''}],
  \     'video': [{'src': ''}],
  \     'image': [{'src': '', 'mode': 'scaleToFill'}],
  \   }
  \ },
  \}

"" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

"" 所生成的数据文件的名称 "
"let g:gutentags_ctags_tagfile = '.tags'

"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags
"" 检测 ~/.cache/tags 不存在就新建 "
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif

"" 配置 ctags 的参数 "
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"g:ale_completion_enabled=1

let g:ale_linters = {
  \ 'c++':['clang'],
  \ 'python':['pylint'],
  \ 'javascript': ['eslint'],
      \}

"auto format code
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

"autocmd FileType python :call coc#config("suggest.autoTrigger", "none")

"select python version 
"let g:ncm2_jedi#python_version = 3

"jedi vim config
"let g:jedi#auto_initialization =1 
let g:jedi#completions_enabled = 0
"let g:jedi#show_call_signatures = 1

""缓存
"autocmd BufEnter * call ncm2#enable_for_buffer()
"" 补全模式,具体详情请看下文
"set completeopt=menu,noinsert
"set shortmess+=c
""inoremap <c-c> <ESC>
"" 延迟弹窗,这样提示更加流畅
"let ncm2#popup_delay = 5
""输入几个字母开始提醒:[[最小优先级,最小长度]]
""如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在输入3个字符弹出,如果大于等于7,则2个字符弹出----优先级概念请参考文档中 ncm2-priority 
"let ncm2#complete_length = [[1, 1]]
""模糊匹配模式,详情请输入:help ncm2查看相关文档
"let g:ncm2#matcher = 'substrfuzzy'
""使用tab键向下选择弹框菜单
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
""使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
""inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"


