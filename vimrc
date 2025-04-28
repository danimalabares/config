"Multiple select (it's almost magical) go to the first line you want to comment, press Ctrl``V, and select until the last line. Second, press Shift``I``#``Esc

call plug#begin()
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-sandwich'
let g:vimtex_compiler_latexmk = {
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \ 'continuous' : 1,
      \ 'callback' : 1, 
      "\ 'engine' : 'lualatex',
      \ 'engine' : 'pdflatex',
      \}
call plug#end()

map <space> <leader>
"nmap <leader>n :!latexmk -lualatex -verbose -file-line-error -synctex=1 -interaction=nonstopmode %<CR>
nmap <leader>z :silent !pdflatex --interaction=nonstopmode --synctex=1 %<CR>
nmap <leader>b :silent !lualatex --interaction=nonstopmode --synctex=1 %<CR>
nmap <leader>n <Plug>(vimtex-compile)
nmap <leader>c <Plug>(vimtex-view)
"nmap <leader>c :w<cr> = <Plug>(vimtex-compile)"
nmap <leader>f :call UltiSnips#RefreshSnippets()<cr>
nmap <leader>r :source ~/.vimrc<cr>
nmap <leader>e \le
nmap <leader>q :q<cr>
nmap <leader>w :wq<cr>
nmap <leader>m :w<cr>
nmap <leader>d :wq<cr>

nnoremap <leader>be :<C-u>execute "normal! sr\\[begin{equation}\n\\end{equation}"<CR>
map <leader>l $
map <leader>j $
nmap ; p$

"insert one character"
nmap f i_<Esc>r

nmap Z i<cr><esc>k$
"nmap f i_<Esc>r
map - $
nmap § $

nmap T <cr>i\item <space><cr><Up><esc>$i
map H 0
map L $
map fh 0
map fl $
imap jk <esc>
imap jd <esc>
imap js <esc>
imap jf <esc>
"imap hd <esc>
"imap hss <esc>
map <leader>k $
map <leader>h 0

inoremap <s-bs> <del>
noremap <D-9> <esc>/,<cr><s-n>i
noremap <D-0> <esc>/,<cr>ni
inoremap <D-9> <esc>/,<cr><s-n>i
inoremap <D-0> <esc>/,<cr>ni
inoremap <D-l> <esc>$i
inoremap <D-h> <esc>0i
inoremap <D-Right> <esc>$i
inoremap <D-Left> <esc>0i
inoremap <A-Right> <esc>wi
inoremap <A-Left> <esc>b


set background=light
autocmd vimenter * ++nested  colorscheme gruvbox
" Returns true if the color hex value is light
function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')
  let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
  return l:brightness > 155
endfunction
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"Hiding \leavevmode"
augroup latex_conceal
  autocmd!
  autocmd FileType tex syntax match ConcealLeaveMode '\\leavevmode' conceal
  autocmd FileType tex setlocal conceallevel=2
augroup END

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['/Users/daniel/github/config/UltiSnips']
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops

set showcmd
set number "see line number"
set backspace=indent,eol,start " backspace over everything in insert mode"

let g:vimtex_view_method = 'sioyek'
let g:vimtex_view_sioyek_exe = "/Users/daniel/Applications/sioyek.app"

let g:UltiSnipsRemoveSelectModeMappings = 1 "Supposedly to stop \ell+Tab from being \e\ell"

"Spellcheck"
setlocal spell
set spelllang=en_gb,pt_br ",es"
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
autocmd BufNewFile,BufRead *.tex set filetype=tex
