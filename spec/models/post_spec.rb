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

    describe 'multiple comma-separate tags' do
      it 'adds each tag to the post' do
        post.tag_names = 'steam, night'
        expect(post.tags.count).to eq 2
      end
      context 'without spaces' do
        it 'adds each tag to the post' do
        post.tag_names = 'steam,night'
        expect(post.tags.count).to eq 2
      end
      end
    end

    describe 'multiple duplicate tags' do
      it 'only adds unique tags to the post' do
        post.tag_names = 'steam, night, steam'
        expect(post.tags.count).to eq 2
      end
    end

    describe 'reusing tags' do
      let!(:tag) { Tag.create(name: '#steam') }

      it 'reuses tags if they exist' do
       post.tag_names = 'steam'
       expect(Tag.count).to eq 1
       expect(tag.posts).to include post
      end
    end

  end
  


end
