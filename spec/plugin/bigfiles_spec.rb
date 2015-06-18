require 'spec_helper'

describe 'disabling YCM on big files' do
  let (:root) { File.expand_path( '../../..', __FILE__ ) }

  before :each do
    vim.command("cd #{root}")
    # lower the threshold for small/big files so we can test it easily
    vim.command('let g:ycm_disable_for_files_larger_than_kb = 5')
  end

  specify 'YCM act normal when the file is small' do
    vim.edit(fixture('4kb_file.py'))
    expect(ycm_active?).to be true
  end

  specify 'YCM is disabled when the file is big' do
    vim.edit(fixture('8kb_file.py'))
    expect(ycm_active?).to be false
  end

  def ycm_active?
    vim.echo('&completefunc') == 'youcompleteme#Complete'
  end
end
