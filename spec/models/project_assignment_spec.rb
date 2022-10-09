require 'rails_helper'

RSpec.describe ProjectAssignment, type: :model do
  context 'association' do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
end
