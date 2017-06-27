require 'rails_helper'

describe WorkExperiencesController do

  before :each do
    @user = sign_in create(:user)
    @application = create(:application)
  end

  describe 'GET #index' do
    before :each do
      @work_experience1 = create(:work_experience, application_id: @application.id)
      @work_experience2 = create(:work_experience, application_id: @application.id)
    end
    it 'returns an array of all work experiences of the given application' do
      get :index, params: { application_id: @application.id }
      expect(assigns(:work_experiences)).to match_array([@work_experience1,
        @work_experience2])
    end
    it 'does not include work experiences from other application' do
      work_experience = create(:work_experience)
      get :index, params: { application_id: @application.id }
      expect(assigns(:work_experiences)).not_to include(work_experience)
    end
    it 'renders the :index template' do
      get :index, params: { application_id: @application.id }
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns a new WorkExperience to @work_experience' do
      get :new, params: { application_id: @application.id }
      expect(assigns(:work_experience)).to be_a_new(WorkExperience)
    end
    it 'renders the :new template' do
      get :new, params: { application_id: @application.id }
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the given work_experience to @work_experience' do
      work_experience = create(:work_experience)
      get :edit, params: { application_id: @application.id, id: work_experience }
      expect(assigns(:work_experience)).to eq work_experience
    end
    it 'renders the :edit template' do
      work_experience = create(:work_experience)
      get :edit, params: { application_id: @application.id, id: work_experience }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves new WorkExperience to database' do
        expect{
          post :create, params: { application_id: @application.id, work_experience: attributes_for(:work_experience) }
        }.to change(WorkExperience, :count).by(1)
      end
      it 'redirects to application_work_experiences_path' do
        post :create, params: { application_id: @application.id, work_experience: attributes_for(:work_experience) }
        expect(response).to redirect_to application_work_experiences_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save new WorkExperience to database' do
        expect{
          post :create, params: { application_id: @application.id, work_experience: attributes_for(:invalid_work_experience) }
        }.not_to change(WorkExperience, :count)
      end
      it 're-renders the :new template' do
        post :create, params: { application_id: @application.id, work_experience: attributes_for(:invalid_work_experience) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @work_experience = create(:work_experience)
    end
    context 'with valid attributes' do
      it 'locates the given @work_experience' do
        patch :update, params: { id: @work_experience, application_id: @application.id, work_experience: attributes_for(:work_experience) }
        expect(assigns(:work_experience)).to eq(@work_experience)
      end
      it 'changes the attributes of @work_experience' do
        patch :update, params: { id: @work_experience, application_id: @application, work_experience: attributes_for(:work_experience, employer: 'ABC') }
        @work_experience.reload
        expect(@work_experience.employer).to eq('ABC')
      end
      it 'redirects to application_work_experiences_path' do
        patch :update, params: { id: @work_experience, application_id: @application.id, work_experience: attributes_for(:work_experience) }
        expect(response).to redirect_to application_work_experiences_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change the attributes of @work_experience' do
        patch :update, params: { id: @work_experience, application_id: @application.id, work_experience: attributes_for(:work_experience, employer: nil) }
        @work_experience.reload
        expect(@work_experience.employer).not_to eq(nil)
      end
      it 're-renders :edit template' do
        patch :update, params: { id: @work_experience, application_id: @application.id, work_experience: attributes_for(:work_experience, employer: nil) }
        expect(response).to render_template :edit
      end
    end
  end
end