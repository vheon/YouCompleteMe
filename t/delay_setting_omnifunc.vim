filetype plugin on
runtime! plugin/youcompleteme.vim
call youcompleteme#Enable()

describe 'delay setting the omnifunc'
  it 'set the omnifunc as soon as we enter insert mode'
    edit python/ycm/base.py
    startinsert
    Expect b:ycm_omnicomplete == 0
    Expect &omnifunc ==# "youcompleteme#OmniFunction"
  end
end
