require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validations' do
    it 'ensures title presence' do
      project = Project.new(description: "sample description", status: "completed").save
      expect(project).to eq(false)
    end

    it 'ensures description presence' do
      project = Project.new(title: "new project", status: "completed").save
      expect(project).to eq(false)
    end

    it 'ensures status presence' do
      project = Project.new(title: "new project", description: "sample description").save
      expect(project).to eq(false)
    end

    it { should define_enum_for(:status).with_values([:draft, :in_process, :completed]) }
  end

  context 'association' do
    it { should have_many(:project_assignments).dependent(:destroy) }
    it { should have_many(:users).through(:project_assignments) }
    it { should have_many(:tasks).dependent(:destroy) }
  end
end
