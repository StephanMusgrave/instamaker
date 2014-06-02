require 'spec_helper'

describe 'tagging posts' do
  before do
    @steve = create(:user)
    login_as @steve
  end

    it 'displays the tags on the posts page' do
      visit '/posts/new'
      fill_in 'Title', with: 'Picture 1'
      fill_in 'Description', with: 'My first Picture'
      attach_file 'Picture', Rails.root.join('spec/images/steam1.jpg')
      fill_in 'Tags', with: 'steam, night'
      click_button 'Create Post'

      expect(page).to have_content '#steam'
      expect(page).to have_content '#night'
    end

    it 'can filter posts by tag' do
      create(:post, title: 'Pic1', tag_names: 'steam', user: @steve)
      create(:post, title: 'Pic2', tag_names: 'night', user: @steve)
      visit '/posts'
      click_link '#steam'
      expect(page).to have_css 'h1', text: 'Posts tagged with #steam'
      expect(page).to have_content 'Pic1'
      expect(page).not_to have_content 'Pic2'

    end

end