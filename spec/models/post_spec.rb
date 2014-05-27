require 'spec_helper'

describe Post do
  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to have(2).error_on(:title)
  end

end
