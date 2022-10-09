require 'rails_helper'

RSpec.describe User, type: :model do
  context 'association' do
    it { should have_many(:project_assignments).dependent(:destroy) }
    it { should have_many(:projects).through(:project_assignments) }
  end
end
