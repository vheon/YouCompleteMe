require 'spec_helper'

describe "semantic completion" do
  let(:filename) { 'test.cpp' }

  it "we have a semantic engine" do
    write_file '.ycm_extra_conf.py', <<-EOF
      def FlagsForFile( filename ):
        return {
          'flags': ['-x', 'c++'],
          'do_cache': True
        }
    EOF
    set_buffer_contents <<-EOF
      struct Foo {
        int integer;
        char character;
      };

      int main()
      {
        Foo foo;
      }
    EOF
    vim.search 'Foo foo;'
    vim.normal 'o'

    # Trigger the semantic completion; we have to use feedkeys_input because we
    # need a little delay between typed characters
    vim.feedkeys_input 'foo.h'
    # Chose the candidate
    vim.feedkeys '\<Tab>'
    # Continue typing the end of the line
    vim.feedkeys ';'

    expect(vim.buffer_content).to eq("")
    expect(vim.current_line).to include("foo.character")
  end
end
