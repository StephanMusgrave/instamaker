require 'spec_helper'

describe 'tagging posts' do
  before do
    steve = create(:user)
    login_as steve
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

end