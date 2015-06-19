require 'spec_helper'

describe "semantic completion" do
  let(:filename) { 'test.cpp' }

  it "we have a semantic engine" do
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
    vim.insert 'foo.'
    vim.type '<c-n><c-n><c-n>'
    vim.type ';'
    vim.normal
    vim.write
    assert_buffer_contents <<-EOF
      struct Foo {
        int integer;
        char character;
      };

      int main()
      {
        Foo foo;
        foo.character;
      }
    EOF
  end
end
