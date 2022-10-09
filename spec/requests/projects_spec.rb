require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user1) { create(:user) }

  before do
    sign_in user1
  end

  describe 'POST /projects' do
    let(:params) { { title: "new project", description: "description", status: "completed", user_ids: [user1.id] } }
    it 'return http success' do
      post "/projects", params: { project: params }
      expect(response).to redirect_to(project_url(Project.last))
    end
  end

  describe 'PUT /projects/:id' do
    let(:project) { create(:project) }
    let(:params) { { title: "new project", description: "description", status: "completed", user_ids: [user1.id] } }
    it 'return http success' do
      put "/projects/#{project.id}", params: { project: params }
      expect(response).to redirect_to(project_url(Project.last))
    end
  end

  describe 'DELETE /projects/:id' do
    let(:project) { create(:project) }
    it 'return http failure' do
      delete "/projects/#{project.id}"
      expect(response).to have_http_status(303)
    end
  end
end
