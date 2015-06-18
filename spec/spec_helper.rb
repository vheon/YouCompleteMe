require 'vimrunner'
require 'vimrunner/rspec'

Vimrunner::RSpec.configure do |config|
  pluging_path = File.expand_path( '../..', __FILE__ )

  config.start_vim do
    vim = Vimrunner.start
    # we have to manually source the plugin/youcompleteme.vim script and call
    # the Enable function because we load the plugin after vim is started so
    # the plugin directories are already loaded and the VimEnter event is
    # already fired
    vim.add_plugin( pluging_path, 'plugin/youcompleteme.vim' )
    vim.command( 'call youcompleteme#Enable()' )
    vim
  end
end
