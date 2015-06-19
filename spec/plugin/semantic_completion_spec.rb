require 'spec_helper'

describe "semantic completion" do
  context "we have a semantic completion" do
    specify "YCM uses the native completion when needed" do
      set_buffer_contents 'test.py', <<-EOF
      class Foo(object):
        def __init__(self):
          self.one = 1
          self.two = 2

      f = Foo()
      EOF
      vim.search 'Foo()'
      vim.normal 'o'

      # Trigger the semantic completion; we have to use feedkeys_input because we
      # need a little delay between typed characters
      vim.feedkeys_input 'f.w'
      # Chose the candidate
      vim.user_feedkeys '\<Tab>'
      # Continue typing the end of the line
      vim.feedkeys_input ' = 5'

      expect(vim.current_line).to include("f.two = 5")
    end
  end
end
