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

" 是否显示隐藏文件
let NERDTreeShowHidden=1

" vim-plug
call plug#begin('~/.config/nvim/autoload/pluged')

" " Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'ludovicchabant/vim-gutentags'

"目录文件树插件 catalog file tree plug
Plug 'preservim/nerdtree'

"vim-autopep8 自动格式化
Plug 'tell-k/vim-autopep8'

"ncm2 auto complete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'HansPinckaers/ncm2-jedi'

"Jedi-vim the function is also code completion 
"here assist ncm2,open method parameter reminder
Plug 'davidhalter/jedi-vim'

call plug#end()


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

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


let g:ale_linters = {
  \ 'c++':['clang'],
  \ 'pyhthon':['pylint'],
  \ 'javascript': ['eslint'],
      \}

"auto format code
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>

"jedi vim config
let g:jedi#auto_initialization =1 
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 1
