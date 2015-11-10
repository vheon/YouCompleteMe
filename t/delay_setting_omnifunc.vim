filetype plugin on
runtime! plugin/youcompleteme.vim

describe 'delay setting the omnifunc'
  it 'set the omnifunc as soon as we enter insert mode'
    call youcompleteme#Enable()
    edit python/ycm/base.py
    redir => msgs
    messages
    redir END
    let msg = [&rtp, split(msgs, '\n'), exists(':YcmRestartServer')]
    Expect msg == []
    startinsert
    Expect &omnifunc ==# "youcompleteme#OmniFunction"
  end
end
