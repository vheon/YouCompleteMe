module Support
  module Vim
    def set_buffer_contents(filename, string)
      write_file(filename, string)
      vim.edit(filename)
    end

    def assert_buffer_contents(string)
      expected = normalize_string_indent(string)
      file_contents = IO.read(filename).strip
      expect(file_contents).to eq(expected)
    end
  end
end
