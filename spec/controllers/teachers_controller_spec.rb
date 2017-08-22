require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  describe "GET #index" do
    before :each do
      @app = create(:application)
      @user = sign_in create(:user)
    end

    context "user is accepted" do
      it "renders index" do
        controller.current_user.application = @app
        @app.application_status = "accepted"
        get :index
        expect(response).to render_template :index
      end
    end

    context "user is rejected" do
      it "redirects to pages#index" do
        controller.current_user.application = @app
        get :index
        expect(response).to redirect_to "/"
      end
    end
  end
end
