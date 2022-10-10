require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user1) { create(:user) }
  let(:project) {create(:project)}
  let!(:project_assignment) { create(:project_assignment, project: project, user: user1) }

  before do
    sign_in user1
  end

  describe 'GET /tasks/:id' do
    let(:task) { create(:task, reporter_id: user1.id, assignee_id: user1.id, project: project) }
    let(:params) { { project_id: project.id } }
    it 'return http success' do
      get "/tasks/#{task.id}", params: params
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tasks' do
    let(:params) { { title: "new project", description: "description", status: "completed",
       reporter_id: user1.id, assignee_id: user1.id, project_id: project.id  } }
    it 'return http success' do
      post "/tasks", params: { task: params }
      expect(response).to redirect_to(task_url(project_id: project.id, id: Task.last.id))
    end
  end

  describe 'PUT /tasks/:id' do
    let(:task) { create(:task, reporter_id: user1.id, assignee_id: user1.id, project_id: project.id) }
    let(:params) { { title: "new project", description: "description", status: "completed",
      reporter_id: user1.id, assignee_id: user1.id, project_id: project.id  } }
    it 'return http success' do
      put "/tasks/#{task.id}", params: { task: params }
      expect(response).to redirect_to(task_url(project_id: project.id, id: Task.last.id))
    end
  end

  describe 'DELETE /tasks/:id' do
    let(:task) { create(:task, reporter_id: user1.id, assignee_id: user1.id, project: project) }
    let(:params) { { project_id: project.id } }
    it 'return http failure' do
      delete "/tasks/#{task.id}", params: params
      expect(response).to have_http_status(303)
      expect(response).to redirect_to(project_url(project))
    end
  end
end
