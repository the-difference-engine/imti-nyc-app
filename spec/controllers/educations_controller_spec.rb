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

  describe 'GET #new' do
    before :each do 
      @app = create(:application, id: 1)
      @user = sign_in create(:user)
    end
    
    it 'assigns a new Education to @education' do
      get :new, {:application_id => @app.id}
      expect(assigns(:education)).to be_a_new(Education)
    end

    it 'renders a :new template' do
      get :new, {:application_id => @app.id}
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before :each do 
      @app = create(:application, id: 1)
      @user = sign_in create(:user)
    end

    it 'assigns the requested Education to @education' do
      edu = create(:education)
      get :edit, {id: edu.id, :application_id => @app.id}
      expect(assigns(:education)).to eq edu
    end

    it 'renders the :edit template' do
      edu = create(:education)
      get :edit, {id: edu.id, :application_id => @app.id}
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before :each do 
      @app = create(:application, id: 487)
      @user = sign_in create(:user)
    end
    context 'with valid attributes'
      it 'saves an education to the database' do
        edu_params = FactoryGirl.attributes_for(:education)
        expect { post :create, :education => edu_params, application_id: @app.id }.to change(Education, :count).by(1)
      end 

      it 'should redirect to application_educations_path with successful save' do
        edu_params = FactoryGirl.attributes_for(:education)
        add = {:application_id=> 99}
        edu_params.merge!(add)
        post :create, :education => edu_params, application_id: @app.id
        expect(response).to redirect_to application_educations_path
      end
  end
end
