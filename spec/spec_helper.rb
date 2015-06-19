require 'vimrunner'
require 'vimrunner/rspec'
require_relative 'support/vim'

PLUGIN_PATH = File.expand_path( '../..', __FILE__ )

Vimrunner::RSpec.configure do |config|
  config.start_vim do
    vim = Vimrunner.start_gvim
    # we have to manually source the plugin/youcompleteme.vim script and call
    # the Enable function because we load the plugin after vim is started so
    # the plugin directories are already loaded and the VimEnter event is
    # already fired
    plugin_path = File.expand_path( '../..', __FILE__ )
    vim.add_plugin( PLUGIN_PATH, 'plugin/youcompleteme.vim' )
    vim.command('let g:ycm_confirm_extra_conf = 0')
    vim.command( 'call youcompleteme#Enable()' )

    def vim.edit_fixture( name )
      edit( File.join( PLUGIN_PATH, 'spec', 'fixtures', name ) )
    end

    def vim.feedkeys_input( input )
      input.chars.to_a.each { |c| feedkeys c; sleep 0.25 }
    end

    def vim.current_line
      echo "getline('.')"
    end

    def vim.buffer_content
      echo(%<join(getbufline('%', 1, '$'), "\n")>)
    end

    vim
  end
end

RSpec.configure do |config|
  config.include Support::Vim
end
