require 'spec_helper'

describe 'Admin' do
  it 'cannot sign-up' do
    visit '/admin/sign_up'
    expect(page).to have_error
  end
end