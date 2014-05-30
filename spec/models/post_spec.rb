require 'spec_helper'

describe Post do
  let(:post) { create(:post) }

  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to have(2).error_on(:title)
  end

  describe '#tag_names' do
    describe 'no tags' do
      it 'does nothing' do
        post.tag_names = ''
        expect(post.tags).to be_empty
      end
    end

    describe 'one tag' do
      it 'adds a single tag to the post' do
        post.tag_names = 'steam'
        expect(post.tags.count).to eq 1
      end
      it 'prepends the tag with a # if necessary' do
        post.tag_names = 'steam'
        tag = post.tags.last
        expect(tag.name).to eq '#steam'
      end
      it 'does not double up #s' do
        post.tag_names = '#steam'
        tag = post.tags.last
        expect(tag.name).to eq '#steam'
      end    
    end

  end



end
