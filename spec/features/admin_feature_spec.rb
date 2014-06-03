require 'spec_helper'

describe 'Admin' do
  it 'cannot sign-up' do
    
    expect{visit '/admin/sign_up'}.to raise_error
  end
end