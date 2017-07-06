require 'rails_helper'

RSpec.describe Document, type: :model do
  it "should have a valid factory girl" do
    expect(FactoryGirl.create(:document)).to be_valid
  end

  it "should only be specified category" do
    document = FactoryGirl.create(:document)
    document.category = "personal_essay"
    expect(document).to be_valid
  end

  it "should not be and unspecified category" do
    document = FactoryGirl.create(:document)
    document.category = "party_form"
    expect(document).to_not be_valid
  end

  it "should have a file size above zero" do
    document = FactoryGirl.create(:document)
    document.attachment_file_size = 100
    expect(document).to be_valid
  end

  it "should be the correct file type" do
    document = FactoryGirl.create(:document)
    document.attachment_content_type = "application/pdf"
    expect(document).to be_valid
  end

  it "should not be an unvalidated file type" do
    document = FactoryGirl.create(:document)
    document.attachment_content_type = "application/rtf"
    expect(document).to_not be_valid
  end

  it "should not have a nil application id" do
    document = FactoryGirl.create(:document)
    document.application_id = nil
    expect(document).to_not be_valid
  end
end
