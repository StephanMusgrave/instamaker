require 'spec_helper'

describe Tag do
  it 'should be unique' do
    Tag.create(name: '#steam')
    duplicate = Tag.new(name: '#steam')
    expect(duplicate).to have(1).error_on(:name)
  end
end
