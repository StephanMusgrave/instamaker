require 'spec_helper'

describe 'liking posts' do
  before do
    user = create(:user)
    login_as user, scope: :user
    
  end

  it 'increments the like count by one', js: true do
    visit '/posts/new'
    fill_in 'Title', with: 'Picture 1'
      fill_in 'Description', with: 'My first Picture'
      attach_file 'Picture', Rails.root.join('spec/images/steam1.jpg')
      click_button 'Create Post'
      click_link '♥ 0'
      sleep(3)
      expect(Like.count).to eq 1
      visit '/posts'
      expect(page).to have_css '.like_button', text: '♥ 1'
  end

end