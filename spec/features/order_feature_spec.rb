require 'spec_helper'

describe 'orders page' do
  let(:post) { create(:post) }
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  context 'logged in as admin' do
    context 'no orders' do
      it 'sees a message' do
        visit '/orders'
        expect(page).to have_content 'No orders yet'
      end
    end
  end
  
  context 'not logged in as admin' do
      it 'prompts to sign in ' do
        visit '/orders'
        expect(page).to have_content 'sign in'
      end
  end

  # before do
  #   Order.create(post: post,)
  # end

  
end