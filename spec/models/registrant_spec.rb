require 'rails_helper'

describe Registrant do
  it 'is valid with first name, last name, affiliation, occupation, email' do
    expect(build(:registrant)).to be_valid
  end
end