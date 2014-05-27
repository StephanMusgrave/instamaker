require 'spec_helper'

describe 'posts index page' do
  context 'no posts have been added' do
    it 'should display a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a post'
    end
  end
end