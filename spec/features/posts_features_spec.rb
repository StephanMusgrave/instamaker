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

  context 'logged in' do 
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
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
end

describe 'Editing a post' do
  before { Post.create(title: 'Photo', description: 'a test picture')}
  
  context 'logged out' do
    it 'shows no edit link' do
      visit '/posts'
      expect(page).not_to have_link 'Edit'
    end
  end
  
  context 'logged in' do
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
    end
  
    it 'saves the change to the post' do
          visit '/posts'
          click_link 'Edit'

          fill_in 'Title', with: 'Changed title'
          click_button 'Update Post'
          
          expect(current_path).to eq '/posts'
          expect(page).to have_content 'Changed title'
    end
  end
end

describe 'Delete a post' do
  before { Post.create(title: 'Photo1', description: 'a test picture')}

  context 'logged out' do
    it 'shows no edit link' do
      visit '/posts'
      expect(page).not_to have_link 'Edit'
    end
  end
  
  context 'logged in' do
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
    end

    it 'removes the post' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content 'Photo1'
      expect(page).to have_content 'Deleted successfully'
    end
  end
end

describe 'deleting another users post' do
    
  before do
    steve = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
    alex  = User.create(email: 'Alex@a.com', password: 'password', password_confirmation: 'password')
    Post.create(title: "Alex's Photo", description: 'a test picture')
    login_as steve
  end

  it 'is removed from the posts page' do
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content "Alex's Photo"
  end

end






















