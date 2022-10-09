require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let(:user1) { create(:user) }
  let!(:project1) { create(:project) }
  let!(:project_assignment) { create(:project_assignment, project: project1, user: user1) }

  describe 'GET /' do
    it 'returns http success' do
      sign_in user1
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
