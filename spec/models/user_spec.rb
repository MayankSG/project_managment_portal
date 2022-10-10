require 'rails_helper'

RSpec.describe User, type: :model do
  context 'association' do
    it { should have_many(:project_assignments).dependent(:destroy) }
    it { should have_many(:projects).through(:project_assignments) }

    it do
      should have_many(:reported_tasks).
        class_name('Task').
        with_foreign_key('reporter_id')
    end

    it do
      should have_many(:assigned_tasks).
        class_name('Task').
        with_foreign_key('assignee_id')
    end

  end
end
