require 'vimrunner'
require 'vimrunner/rspec'


Vimrunner::RSpec.configure do |config|
  config.start_vim do
    vim = Vimrunner.start
    # we have to manually source the plugin/youcompleteme.vim script and call
    # the Enable function because we load the plugin after vim is started so
    # the plugin directories are already loaded and the VimEnter event is
    # already fired
    plugin_path = File.expand_path( '../..', __FILE__ )
    vim.add_plugin( plugin_path, 'plugin/youcompleteme.vim' )
    vim.command( 'call youcompleteme#Enable()' )

    def vim.edit_fixture( name )
      edit( File.join( __dir__, 'fixtures', name ) )
    end

    vim
  end
end
