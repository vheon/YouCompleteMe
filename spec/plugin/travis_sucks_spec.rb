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
    vim.search 'Foo foo;'
    vim.normal 'o'
    # Trigger the semantic completion; we have to use feedkeys_input because we
    # need a little delay between typed characters
    vim.feedkeys_input 'fo'
    # Chose the candidate
    vim.feedkeys '\<Tab>'
    # Continue typing the end of the line
    vim.feedkeys ';'

    expect(vim.current_line).to include("foo;")
    # expect(vim.buffer_content).to eq("")
  end
end
