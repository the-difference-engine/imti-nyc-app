require 'rails_helper'
require 'pry'
RSpec.describe EducationsController, type: :controller do

  describe 'GET #index' do
    before :each do
      @app = create(:application, id: 1)
      @user = sign_in create(:user)
    end

  context "signed in user"
    it "can populate an array of all educations" do
      monte = create(:education, school: 'Monte', application_id: @app.id)
      sorri = create(:education, school: "Sorri", application_id: @app.id)
      school = create(:education, school: "the school", application_id: @app.id)

      get :index, {:application_id => @app, :user_id => @user}
      expect(assigns(:educations)).to match_array([monte, sorri, school])
    end

  context "signed in user"
    it "can render the :index template" do
      get :index, {:application_id => @app.id}
      expect(response).to render_template :index
    end
  end
end
