require 'rails_helper'

RSpec.describe LocalSchoolsController, type: :controller do
	before do 
		@user = sign_in create(:user)
		@local_school = create(:local_school)
	end

	describe 'PATCH #update' do
		before do 
			@user = sign_in create(:user)
			@local_school = create(:local_school)
			@local_school_params = { contact_name: 'bob jones', school_address: '123 America Street, USA' }
		end
		
		it 'locates requested @local_school' do
			patch :update, params: {id: @local_school.id, local_school: @local_school_params }
			expect(assigns(:local_school)).to eq(@local_school)
		end

		it 'changes @local_school attributes' do
			patch :update, params: { id: @local_school.id, local_school: @local_school_params }
			@local_school.reload
			expect(@local_school.contact_name).to eq(@local_school_params[:contact_name])
		end

		it 'redirects the updated local school' do
			patch :update, params: { id: @local_school, local_school: @local_school_params }
			expect(response).to redirect_to "/local_schools"
		end

		it 'does not change attributes with invalid attributes' do
			patch :update, params: { id: @local_school.id, local_school: {contact_name: nil} }
			@local_school.reload
			expect(response).to render_template(:edit)
			expect(@local_school.contact_name).to_not be_nil
		end

	end
end
