filetype plugin on
runtime! plugin/youcompleteme.vim

describe 'delay setting the omnifunc'
  it 'set the omnifunc as soon as we enter insert mode'
    Expect {} == {}
  end
end
