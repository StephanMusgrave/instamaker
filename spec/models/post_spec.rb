require 'spec_helper'

describe Post do
  xit 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to have(1).error_on(:title)
  end

end
