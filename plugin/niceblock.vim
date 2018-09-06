" niceblock - Make blockwise Visual mode more useful
" Version: 0.1.0
" Copyright (C) 2012-2015 Kana Natsuno <http://whileimautomaton.net/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_niceblock')
  finish
endif




vnoremap <expr> <Plug>(niceblock-I)  niceblock#force_blockwise('I')
vnoremap <expr> <Plug>(niceblock-gI)  niceblock#force_blockwise('gI')
vnoremap <expr> <Plug>(niceblock-A)  niceblock#force_blockwise('A')

if !exists('g:niceblock_no_default_key_mappings') ||
			\  !g:niceblock_no_default_key_mappings
	silent! xmap <unique> I  <Plug>(niceblock-I)
	silent! xmap <unique> gI  <Plug>(niceblock-gI)
	silent! xmap <unique> A  <Plug>(niceblock-A)
endif




let g:loaded_niceblock = 1

" __END__
" vim: foldmethod=marker
