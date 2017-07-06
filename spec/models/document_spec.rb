require 'rails_helper'

RSpec.describe Document, type: :model do
  it "has a valid factory girl" do
    expect(FactoryGirl.create(:document)).to be_valid
  end

  it "can only be specified category" do
    document = FactoryGirl.create(:document)
    document.category = "personal_essay"
    expect(document).to be_valid
  end

  it "cannot be an unspecified category" do
    document = FactoryGirl.create(:document)
    document.category = "party_form"
    expect(document).to_not be_valid
  end

  it "is the correct file type" do
    document = FactoryGirl.create(:document)
    document.attachment_content_type = "application/pdf"
    expect(document).to be_valid
  end

  it "doesn't have an unvalidated file type" do
    document = FactoryGirl.create(:document)
    document.attachment_content_type = "application/rtf"
    expect(document).to_not be_valid
  end

  it "doesn't have a nil application id" do
    document = FactoryGirl.create(:document)
    document.application_id = nil
    expect(document).to_not be_valid
  end
end
