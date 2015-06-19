require 'spec_helper'

describe "it sucks" do
  let(:filename) { 'test.cpp' }
  it "right?" do
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
    vim.insert 'Ciao come va?'
    vim.write

    expect(vim.buffer_content).to eq("")
  end
end
