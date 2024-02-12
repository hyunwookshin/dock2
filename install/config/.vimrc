""""""""""""""""""""""""""""""""""""""""""""""""
" HYUNWOOK SHIN VIM SHORT CUTS
"
""""""""""""""""""""""""""""""""""""""""""""""""
"BASICS
"
" Built-Ins -----------------------------------
"
" Ctrl + : Zoom in
" Ctrl - : Zoom out
"
" F-Keys----------------------------------------

" Basic Settings
"
" F4 (previous tab) 
" F5 (next tab) 
" F6 (new tab) 
" F7 (repeat second last command) or Remove all Folds
" F8 (repeat third last command) or Toggle fold
" F10 (close no cascading)
" F12 (escape/close cascading)
" 
" App-Level Settings
"
" F1 <custom> Cscope
" F5 <custom> Cscope
" F6 <custom> Cscope
" F9 Use mouse

" Functions--------------------------------------
"
" Load(filename) == <S-L> 
" load file in the new tab
"
" CLoad(object) == <S-C>
" load header and source file in the new tab

"Movement----------------------------------------

"Insert Mode Movement" 

"       [UP   ]
"[LEFT] [DOWN ] [RIGHT]

"Normal Mode Movement
"
"
"[H  ][J  ][K  ][L ]
"
"[ Ctrl + U ]: Scroll Up
"[ Ctrl + D ]: Scroll Down
"
"Fast Movements
"
" [   M ] UP * 5
" [SPACE] DOWN * 5
"
"Special Keys-----------------------------------
"
" [ ,  ] Fold from anchor to cursor
" [ .  ] set cursor
" [ /  ] search
" [ ;  ] :
"
"Pane Switch------------------------------------ 
"
" [  ' ] switching to the right pane
" [  \ ] switching to the left pane 

"Numbers----------------------------------------

" <#>` go to that line number
" - tab in normal mode

"Shift------------------------------------------

" <SHIFT O> insert new line and escape
" <SHIFT U> bubble up a line
" <SHIFT D> bubble down a line
" <SHIFT P> duplicate a line 
" <SHIFT Z> shift left pane to the left
" <SHIFT X> shift right pane to the right
" <SHIFT B> fall back to anchor (set using '.' )

"Other-------------------------------------------

" Enter    insert new line
" Delete   delete line
" <c-h>    open .vimrc
"
" Ctrl Plugin
"
" <C-d>    diff friendly keys activated
" <C-d>    diff friendly keys activated
"
"""""""""""""""""""""""""""""""""""""""""""""""""
" Open Vimrc
"
" Some problem in vim of cursor sliding back
" http://stackoverflow.com/questions/2295410/
" prevent-cursor-from-moving-back-one-character-on-insert-mode-exit
"

"source ~/.vim/plantuml.vim


""""""""""""""""""""""""""""""""""""""""""""""""
map  <C-H> <ESC>:e $HOME/.vimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" make sure you have 256-color (echo $TERM)
set t_Co=256

" stop screen from bleeding terminal background
set term=screen-256color
"
"Customize colorscheme here (under .vim/colors)
colorscheme xoria256
":colorscheme darkblue

"""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen Plugin Manager

execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree

function OpenNERDTree()
   :let s:NERDTreeWinSize =20
   :execute ":NERDTree"
endfunction

command -nargs=0 OpenNERDTree :call OpenNERDTree()
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
":vsplit
:call feedkeys("\<C-W>l")
":call feedkeys(":set nowrap\<CR>")
":call feedkeys(":set nu\<CR>")
":call feedkeys(":e $HOME/.vimrc\<CR>")
":call feedkeys("\<C-W>h")
:vertical resize 120

""""""""""""""""""""""""""""""""""""""""""""""""""
"Pane
:set fillchars+=vert:\ 
:highlight VertSplit ctermbg=233 

"""""""""""""""""""""""""""""""""""""""""""""""""
"Movement

"Special keys

:map ; :
:map . :call Anchor()<CR>
:map , 0
:map / :/
:map e ea

"Express Movement and Galloping (1.33 x)

:let s:jump = 4

function GallopDown()
:let l:count = 1
:while l:count <= s:jump
:  call feedkeys("j")
:  let l:count += 1
:endwhile
:let s:jump += s:jump/3
:endfunction

function GallopUp()
:let l:count = 1
:while l:count <= s:jump
:  call feedkeys("k")
:  let l:count += 1
:endwhile
:let s:jump += s:jump/3
:endfunction

function Reset()
:let s:jump = 4 
:endfunction

":map b :call GallopUp()<CR>
":map c :call GallopDown()<CR>
":map = :call Reset()<CR>

"Simple 5 line jump
:map m kkkkk
:map <space> jjjjj
:map t i<Right><Right><Right><Right><Right><ESC>

"Alt forces move in normal mode
:inoremap <A-;> <ESC>k
:inoremap <A-,> <ESC>h
:inoremap <A-/> <ESC>l
:inoremap <A-.> <ESC>j

"<right> is there to correct
:inoremap <C-j> <ESC>i<Down><Right>
:inoremap <C-k> <ESC>i<Up><Right>
:inoremap <C-l> <ESC>i<Right><Right>
:inoremap <C-r> <ESC>i<Left><Right>
"
"Exiting 
:inoremap <C-i> <ESC>

"Switching pane
:map ' <C-W>h
:map \ <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""
"tab short cuts, file open, close short cuts

":map <F6> <ESC>:wa<CR>
:map <F4> <ESC>:tabp<CR>
:map <F5> <ESC>:tabn<CR>
":inoremap <F6> <ESC>:wa<CR>i
:inoremap <F4> <ESC>:tabp<CR>i
:inoremap <F5> <ESC>:tabn<CR>i
:map - <ESC>:e.<CR>

"Open in a new tab (already used for resetting jump)
":map = <ESC>:tabnew<CR>:vsplit<CR>:vertical resize 120<CR>:OpenNERDTree<CR><C-W>l<CR>:set nu<CR>:set nowrap<CR>:e.<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"open and close tabs <F12> allows cascading closure

:map <F6> <ESC>:tabnew<CR>:OpenNERDTree<CR>\
:inoremap <F4> <ESC><F4>
:map <F10> <ESC>:q<CR>
:map <F12> <ESC>:q!<CR>:q!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" Basic setings

function BasicSettings()
  :set guioptions+=T 
  :set nocompatible
  :set hlsearch
  :set showtabline=2
  :set backspace=2
  :set nu
  :set nowrap
  ":set mouse=a
  :imap <F12> <ESC>
  :set incsearch
  :set showmatch
  :set smartcase
  :set noswapfile
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" Windows map

function SetDocKeys()
  :inoremap <C-C> <ESC>y<CR>
  :inoremap <C-S> <ESC>:wa<CR>
  :inoremap <C-Z> <ESC>u<CR>
  :inoremap <C-P> <ESC>p<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Go to <number>

function SetGoTo()
   :nmap ` G
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"C style Indentation, Autocompletion and Highlight

function CStyle()
   :set cindent
   :set shiftwidth=3  
   ":syntax on
   ":inoremap <RightMouse> <C-N>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Basic C++ Compilations

function SetCompilation()
   :map <C-C> <ESC>:!g++ -o vim_compiled_target -ggdb *.cc > vim_compiled_logs;cat vim_compiled_logs;cat vim*logs<CR>
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
"Arrows

function Arrows()
   :map <Up> ki
   :map <Down> ji
   :map <Right> li
   :map <Left> hi
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
"Text Edit Shortcuts

function EditShortcuts()
   :nmap <S-U> <S-V>xkkp<ESC>
   :nmap <S-D> ddp<ESC>
   :nmap <S-0> o<ESC>  
   :nmap <CR> O<Down><ESC>
   :nmap <S-P> <S-V>yp 
   :nmap vv <S-V>   
   :vmap <S-U> xkkp<ESC>
   :map <BS> i<BS> 
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Repeat first, second, third last commands over

function PreviousCommands()
   :imap <F6> <ESC>:<Up><CR>
   :imap <F7> <ESC>:<Up><Up><CR>
   :imap <F8> <ESC>:<Up><Up><Up><CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Text Wrapping and Line

" See above for text wrapping
function TextWrapping()
   :set tabstop=4
   :highlight ColorColumn ctermbg=233
   :set whichwrap+=<,>,h,l,[,]
   :set colorcolumn=83
   :set colorcolumn=84
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Auxilary

function CShortcuts()
   :inoremap <c-N> #include
   :inoremap <c-B> #include<
   :inoremap <c-G> #ifndef
   :inoremap <c-P> printf(
endfunction

function CPPShortcuts()
   :inoremap <c-O> #include <iostream>
   :inoremap <c-V> #include <vector>
   :inoremap <c-S> #include <sstream>
   :inoremap <c-F> #include <fstream>
   :inoremap <c-D> endl;
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" functions

"Load C++/C Object (.cc / .cpp/ .c/ .h) support
"files
:map <s-C> :call CLoad("
"""""""""""""""""""""""""""""""""""""""""""""""""

function CLoad(object)
   :tabnew
   :vsplit
   :vertical resize 120 
   :OpenNERDTree
   :call feedkeys("\<C-W>l")
   :call feedkeys(":edit ".a:object.".c*\<CR>" )
   :call feedkeys("\<C-W>l")
   :call feedkeys(":edit ".a:object.".h\<CR>" )
endfunction

"Regular load in new tab"
:map <S-L> :call Load("

function Load(object)
   :tabnew
   :vsplit
   :vertical resize 120 
   :OpenNERDTree
   :call feedkeys("\<C-W>l")
   :call feedkeys(":edit ".a:object."\<CR>" )
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""
" BoosterKeys

" Added on September 2014
"
" [  F  ]  Search (better than :/ to search)
" [  G  ]  Move cursor ten lines to the right
" [  S  ]  Move cursor ten lines to the left
" [  Q  ]  Quit all
" [  T  ]  three spaces (tab)

:let s:line = 4

function Anchor()
   :let s:line = ( line(".") )
   echo s:line
endfunction

function Toggle()
   :let l:line = ( line(".") )
   echo l:line
   :execute string(s:line)
   :let s:line = l:line
endfunction

function FallBack()
   :execute string(s:line)
endfunction

function FallBackKey()
   :map <s-b> :call FallBack()<CR>
endfunction

function BoosterKeys()
   :map f :/
   :map g llllllllll
   :map s hhhhhhhhhh
   :map q :qa<CR>:w
   :map - i<space><space><space><spacE><ESC>x
   :map r kp
   :map <c-o> :call OpenNERDTree()<CR>
endfunction

function QuickResize()
   if bufwinnr(1)
     map <s-z> <C-W>><C-W>><C-W>>
     map <s-x> <C-W><<C-W><<C-W><
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Diff
" will override some mappings
"
function Diff()
   :map c <NOP>
   :map . c]
   :map ; [c
endfunction

":map <c-d> :call Diff()<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Error Highlighting
"
function ErrorHighlight() 
   highlight SignColumn ctermbg=234
   highlight SyntasticErrorLine ctermbg=233
   highlight SyntasticWarningLine ctermbg=233
   highlight SyntasticWarningSign ctermfg=lightblue
   highlight SyntasticErrorSign ctermfg=red
endfunction
:set expandtab
:set tabstop=3
:set nolist

function Signature()
   "Your name here
   map <s-s> <ESC>:Hyunwook Shin 
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Navigation
"
function TabNavigation()
   map <A-1> :tabn 1<CR>
   map <C-2> :tabn 2<CR>
   map <C-3> :tabn 3<CR>
   map <C-4> :tabn 4<CR>
   map <C-5> :tabn 5<CR>
   map <C-6> :tabn 6<CR>
   map <C-7> :tabn 7<CR>
   map <C-8> :tabn 8<CR>
   map <c-9> :tabn 9<CR>
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" Fold
"
function Fold()
   :let l:line = ( line(".") )
   echo string(l:line)."~".string(s:line)
   :execute string(s:line)
   :let l:difference = l:line - s:line 
   :call feedkeys(string(l:difference)."zF")
endfunction

function SetFold()
   map , :call Fold()<CR>
   map <F8> za
   "za toggles the fold
   map <F7> zE
   "removes all fold
   autocmd BufWinLeave *.* mkview!
   autocmd BufWinEnter *.* silent loadview
endfunction

function SetCscope()
    " yum install -y --enablerepo=* cscope
    " go to directory to save
    " find . -name <file refex> > <scope file>
    " build Cscope database
    " cscope -b -q -i <scope file>
   if has("cscope")
       set csprg=/usr/bin/cscope
       set csto=0
       set cst
       set csverb
       " C symbol
       nmap <F1> :cs find s <C-R>=expand("<cword>")<CR><CR>
       " definition
       nmap <F2> <C-^>
       " definition
       nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
       " functions that called by this function
       nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
       " funtions that calling this function
       nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
       " test string
       nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
       " egrep pattern
       nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
       " file
       nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
       " files #including this file
       nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
       exe "cs add $CSCOPE_DB"
   endif
endfunction

function Cscope() 
   :map <c-c> :call SetCscope()<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
"Mouse Control
"
:let s:mouse = 0
function MouseControl()
   if (s:mouse == 0)
      :set mouse=a
      :let s:mouse=1
   else
      :set mouse=
      :let s:mouse=0
   endif
endfunction

function Mouse()
   map <F9> :call MouseControl()<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" Switches

:call BasicSettings()

:call SetDocKeys()

:call Arrows()

:call SetGoTo()

:call SetCompilation()

:call EditShortcuts()

:call PreviousCommands()

:call TextWrapping()

":call CShortcuts()

":call CPPShortcuts()

:call CStyle()

":call BoosterKeys()

:call FallBackKey()

:call ErrorHighlight()

:call Signature()

:call Cscope()

:call SetFold()
 
:call QuickResize()

":call Mouse()

"Third party plugins/bundles
"https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
