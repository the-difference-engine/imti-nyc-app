require 'rails_helper'

RSpec.describe Document, type: :model do
  it "should have a valid factory girl" do
    expect(FactoryGirl.create(:document)).to be_valid
  end

  it "should only be specified category" do

    # doc_categories = ['health_form', 'personal_essay', 'recommendation', 'resume', 'toefl_ielts_score_report', 'transcript', 'wes_evaluation', 'contract', 'student_visa', 'passport_photo']
    document = FactoryGirl.create(:document)
    document.category = "party_form"
    expect(document).to_not be_valid
  end

end



