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
    it 'works in characterwise Visual mode (1)'
      execute 'normal' "lvjjlIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'fXYZoo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qux',
      \ ]
    end

    it 'works in characterwise Visual mode (2)'
      execute 'normal' "lvjjloIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'fXYZoo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode (1)'
      execute 'normal' "V2GIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   '  baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode (2)'
      execute 'normal' "V2GoIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   '  baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode (3)'
      execute 'normal' "2GVjoIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   '  XYZbar',
      \   '  XYZbaz',
      \   'qux',
      \ ]
    end

    it 'works in blockwise Visual mode (1)'
      execute 'normal' "lj\<C-v>jjlIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qXYZux',
      \ ]
    end

    it 'works in blockwise Visual mode (2)'
      execute 'normal' "lj\<C-v>jjloIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   ' XYZ bar',
      \   ' XYZ baz',
      \   'qXYZux',
      \ ]
    end
  end

  describe '<Plug>(niceblock-gI)'
    it 'works in characterwise Visual mode (1)'
      execute 'normal' "lvjjlgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   'XYZ  baz',
      \   'qux',
      \ ]
    end

    it 'works in characterwise Visual mode (2)'
      execute 'normal' "jjllvkkgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   'XYZ  baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode (1)'
      execute 'normal' "VjgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   '  baz',
      \   'qux',
      \ ]
    end

    it 'works in linewise Visual mode (2)'
      execute 'normal' "jVkgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   '  baz',
      \   'qux',
      \ ]
    end

    it 'works in blockwise Visual mode (1)'
      execute 'normal' "lj\<C-v>jjlgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'foo',
      \   'XYZ  bar',
      \   'XYZ  baz',
      \   'XYZqux',
      \ ]
    end

    it 'works in blockwise Visual mode (2)'
      execute 'normal' "lljj\<C-v>hkkgIXYZ\<Esc>"
      Expect getline(1, '$') ==# [
      \   'XYZfoo',
      \   'XYZ  bar',
      \   'XYZ  baz',
      \   'qux',
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
