require 'spec_helper'

describe 'big files' do
  let (:root) { File.expand_path( '../../..', __FILE__ ) }

  before :each do
    vim.command("cd #{root}")
    vim.command('let g:ycm_disable_for_files_larger_than_kb = 5')
  end


  it 'works fine when the file is smaller than g:ycm_disable_for_files_larger_than_kb' do
    vim.edit('python/ycm/client/completion_request.py')
    expect(vim.echo('&completefunc')).to eq("youcompleteme#Complete")
  end

  it 'disable YCM when the file is larger than g:ycm_disable_for_files_larger_than_kb' do
    vim.edit('python/ycm/client/base_request.py')
    expect(vim.echo('&completefunc')).not_to eq("youcompleteme#Complete")
    # assert for the error message
  end
end
