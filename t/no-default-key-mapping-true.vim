let g:niceblock_no_default_key_mappings = 1

runtime! plugin/niceblock.vim

describe 'UI'
  it 'provides named key mappings'
    Expect maparg('<Plug>(niceblock-I)', 'x') != ''
    Expect maparg('<Plug>(niceblock-A)', 'x') != ''
    Expect maparg('<Plug>(niceblock-I)', 's') != ''
    Expect maparg('<Plug>(niceblock-A)', 's') != ''
  end

  it 'does not provide default key mappings if g:niceblock_no_default_key_mappings is set to true'
    Expect maparg('I', 'x') == ''
    Expect maparg('A', 'x') == ''
    Expect maparg('I', 's') == ''
    Expect maparg('A', 's') == ''
  end
end
