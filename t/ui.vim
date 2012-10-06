runtime! plugin/niceblock.vim

describe 'UI'
  it 'provides named key mappings'
    Expect maparg('<Plug>(niceblock-I)', 'x') != ''
    Expect maparg('<Plug>(niceblock-A)', 'x') != ''
    Expect maparg('<Plug>(niceblock-I)', 's') != ''
    Expect maparg('<Plug>(niceblock-A)', 's') != ''
  end

  it 'provides default key mappings'
    Expect maparg('I', 'x') != ''
    Expect maparg('A', 'x') != ''
    Expect maparg('I', 's') == ''
    Expect maparg('A', 's') == ''
  end
end
