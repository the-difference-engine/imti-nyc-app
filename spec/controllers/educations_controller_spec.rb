require 'rails_helper'
RSpec.describe EducationsController, type: :controller do
  describe 'GET #index' do
    before :each do
      create(:user)
      @app = create(:application)
      @user = sign_in create(:user)
    end

    context "signed in user" do
      it "can populate an array of all educations" do
        monte = create(:education, school: 'Monte', application_id: @app.id)
        sorri = create(:education, school: "Sorri", application_id: @app.id)
        school = create(:education, school: "the school", application_id: @app.id)
        get :index, {:application_id => @app, :user_id => @user}
        expect(assigns(:educations)).to match_array([monte, sorri, school])
      end

      it "can render the :index template" do
        monte = create(:education, school: 'Monte', application_id: @app.id)
        sorri = create(:education, school: "Sorri", application_id: @app.id)
        school = create(:education, school: "the school", application_id: @app.id)
        get :index, params: {:application_id => @app.id}
        expect(response).to render_template :index

        get :index, {:application_id => @app, :user_id => @user}
        expect(assigns(:educations)).to match_array([monte, sorri, school])
      end
    end
  end

  describe 'GET #new' do
    before :each do
      @app = create(:application)
      @user = sign_in create(:user)
    end

    it 'assigns a new Education to @education' do
      get :new, params: {:application_id => @app.id}
      expect(assigns(:education)).to be_a_new(Education)
    end

    it 'renders a :new template' do
      get :new, params: {:application_id => @app.id}
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
      get :edit, params: {id: edu.id, :application_id => @app.id}
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before :each do
      @app = create(:application)
      @user = sign_in create(:user)
    end
    context 'with valid attributes' do
      it 'saves an education to the database' do
        edu_params = FactoryGirl.attributes_for(:education)
        expect { post :create, params: {:education => edu_params, application_id: @app.id } }.to change(Education, :count).by(1)
      end

      it 'should redirect to application_educations_path with successful save' do
        edu_params = FactoryGirl.attributes_for(:education)
        post :create, params: { :education => edu_params, application_id: @app.id }
        expect(response).to redirect_to application_educations_path
      end
    end

    context "with invalid attributes" do
      it 'should list errors' do
        edu_params = FactoryGirl.attributes_for(:education, school: nil)
        post :create, params: { :education => edu_params, application_id: @app.id}
        expect(response.request.flash[:danger]).to_not be_nil
      end

      it 'should render :new template' do
        edu_params = FactoryGirl.attributes_for(:education, school: nil)
        post :create, params: { :education => edu_params, application_id: @app.id}
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @app = create(:application)
      @user = sign_in create(:user)
      @education = create(:education)
    end

    context 'valid attributes' do
      it 'locates requested @education ' do
        patch :update, params: { id: @education.id, application_id: @app.id, education: attributes_for(:education) }
        expect(assigns(:education)).to eq(@education)
      end

      it 'changes @education attribute' do
        patch :update, params: { id: @education.id, application_id: @app.id, education: attributes_for(:education, school: "The Happy School")}
        @education.reload
        expect(@education.school).to eq("The Happy School")
      end

      it 'redirects to application_educations_path' do
        patch :update, params: { id: @education.id, application_id: @app.id, education: attributes_for(:education) }
        expect(response).to redirect_to application_educations_path
      end
    end

    context 'with unvalid attributes' do
      it 'does not change the education attributes' do
        patch :update, params: {id: @education.id, application_id: @app.id, education:attributes_for(:education, school: nil)}
        @education.reload
        expect(@education.school).not_to eq(nil)
      end

      it 'should render the :edit template ' do
        patch :update, params: { id: @education.id, application_id: @app.id, education: attributes_for(:education, school: nil) }
        expect(response).to render_template :edit
      end
    end

    context "signed in user" do
      it "can render the :index template" do
        get :index, {:application_id => @app.id}
        expect(response).to render_template :index
      end
    end

    context 'with valid attributes' do
      it 'saves an education to the database' do
        edu_params = FactoryGirl.attributes_for(:education)
        expect { post :create, :education => edu_params, application_id: @app.id }.to change(Education, :count).by(1)
      end
    end
  end
end
