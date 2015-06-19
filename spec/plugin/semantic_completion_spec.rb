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
    vim.normal 'A'
    vim.type '<cr>'

    vim.feedkeys_input 'foo.h'
    vim.feedkeys '\<Tab>'
    vim.feedkeys ';'
    expect(vim.current_line).to include("foo.character")
  end
end
