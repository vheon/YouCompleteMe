require 'spec_helper'

describe "it sucks" do
  it "right?" do
    vim.edit 'test.txt'
    vim.insert 'Ciao come va?'
    vim.write

    expect(vim.buffer_content).to eq("")
  end
end
