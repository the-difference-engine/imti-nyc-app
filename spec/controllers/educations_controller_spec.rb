require 'rails_helper'

RSpec.describe EducationsController, type: :controller do

  describe 'GET #index' do
    # it "populates an array of all educations" do
    #   monte = create(:education, school: 'Monte')
    #   ssori = create(:education, school: 'ssori')
    #   get :index
    #   expect(assigns(:education)).to match_array([monte, ssori])
    # end
 
    it "renders the :index template" do

      get :index
      expect(response).to render_template :index
    end

  end
end
