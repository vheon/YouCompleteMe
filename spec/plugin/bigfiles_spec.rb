require 'spec_helper'

describe 'disabling YCM on big files' do
  def ycm_active?
    vim.echo('&completefunc') == 'youcompleteme#Complete'
  end

  let (:root) { File.expand_path( '../../..', __FILE__ ) }

  before :each do
    vim.command("cd #{root}")
    # lower the threshold for small/big files so we can test it easily
    vim.command('let g:ycm_disable_for_files_larger_than_kb = 5')
  end

  specify 'YCM act normal when the file is small' do
    # completion_request.py is smaller than 5kb
    vim.edit('python/ycm/client/completion_request.py')
    expect(ycm_active?).to be true
  end

  specify 'YCM is disabled when the file is big' do
    # base_request.py is larger than 5kb
    vim.edit('python/ycm/client/base_request.py')
    expect(ycm_active?).to be false
  end
end
