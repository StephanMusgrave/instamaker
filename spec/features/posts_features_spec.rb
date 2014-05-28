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
  context 'logged out' do
    it 'takes us to sign up page' do
      visit '/posts'
      click_link 'Make a Post'

      expect(page).to have_content 'Sign up'
    end
  end
   
  it 'adds it to the posts page' do
        visit '/posts/new'
        fill_in 'Title', with: 'Picture 1'
        fill_in 'Description', with: 'My first Picture'
        attach_file 'Picture', Rails.root.join('spec/images/steam1.jpg')
        click_button 'Create Post'

        expect(current_path).to eq   '/posts'
        expect(page).to have_content 'Picture 1'
        expect(page).to have_css 'img.uploaded-pic'
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
  before { Post.create(title: 'Photo1', description: 'a test picture')}

  it 'removes the post' do
    visit '/posts'
      click_link 'Delete Photo1'
      expect(page).not_to have_content 'Photo1'
      expect(page).to have_content 'Deleted successfully'
  end 

end
