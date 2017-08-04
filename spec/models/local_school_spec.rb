require 'rails_helper'

RSpec.describe LocalSchool, type: :model do
  let(:local_school) { FactoryGirl.build(:local_school) }

  describe "validations" do
    context "valid" do
      it "is valid with FactoryGirl data" do
        expect(local_school).to be_valid
      end
    end

    context "invalid" do
      it "is invalid without name" do
        local_school.name = nil
        expect(local_school).not_to be_valid
      end

      it "is invalid without contact_name" do
        local_school.contact_name = nil
        expect(local_school).not_to be_valid
      end

      it "is invalid without a school address" do
        local_school.school_address = nil
        expect(local_school).not_to be_valid
      end

      it "is invalid when the code is not unique" do
        local_school.save
        new_local_school = FactoryGirl.build(:local_school, code: local_school.code)
        new_local_school.valid?
        expect(new_local_school).not_to be_valid
        expect(new_local_school.errors[:code]).to include("has already been taken")
      end
    end
  end

  describe "associations" do
    it "has many Users" do
      expect(LocalSchool.reflect_on_association(:users).macro).to eq(:has_many)
    end
  end

  describe "#generate_code" do
    it "generates random code" do
      expect(local_school.code).to be_nil
      local_school.save
      expect(local_school.code).to_not be_nil
    end
  end
end
