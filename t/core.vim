runtime! plugin/niceblock.vim

describe 'Mapping'
  before
    new
    put =[
    \   'foo',
    \   '  bar',
    \   '  baz',
    \   'qux',
    \ ]
    1 delete _
  end

  after
    close!
  end

  describe '<Plug>(niceblock-I)'
    it 'works in characterwise Visual mode'
      execute 'normal' "lvjjlIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'fXYZoo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode'
      execute 'normal' "2GVjIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   'XYZ  bar',
      \   'XYZ  baz',
      \   'qux',
      \ ]
    end

    it 'works in blockwise Visual mode'
      execute 'normal' "lj\<C-v>jjlIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qXYZux',
      \ ]
    end
  end

  describe '<Plug>(niceblock-A)'
    it 'works in characterwise Visual mode'
      execute 'normal' "lvjjllAXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo XYZ',
      \   '  baXYZr',
      \   '  baXYZz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode'
      execute 'normal' "VjAXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'fooXYZ',
      \   '  barXYZ',
      \   '  baz',
      \   'qux',
      \ ]
    end

    it 'works in blockwise Visual mode'
      execute 'normal' "lj\<C-v>jjlAXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   '  bXYZar',
      \   '  bXYZaz',
      \   'quxXYZ',
      \ ]
    end
  end
end
