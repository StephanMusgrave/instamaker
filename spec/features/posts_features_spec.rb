require 'spec_helper'

describe 'posts index page' do

  context 'no posts have been added' do
    it 'should display a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a Post'
    end
  end
end

describe 'Making a post' do
  it 'adds it to the posts page' do
        visit 'posts/new'
        fill_in 'Title', with: 'Picture 1'
        fill_in 'Description', with: 'My first Picture'
        click_button 'Create Post'

        expect(current_path).to eq   '/posts'
        expect(page).to have_content 'Picture 1'
  end
end


describe 'Editing a post' do
  before { Post.create(title: 'Photo', description: 'a test picture')}
  it 'saves the change to the post' do
        visit '/posts'
        click_link 'Edit Photo'

        fill_in 'Title', with: 'Changed title'
        click_button 'Update Post'
        
        expect(current_path).to eq '/posts'
        expect(page).to have_content 'Changed title'
      end



end

describe 'Delete a post' do


end