require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { create(:project) }
  context 'validations' do
    it 'ensures title presence' do
      task = Task.new(description: "sample description", status: "completed", project: project).save
      expect(task).to eq(false)
    end

    it 'ensures description presence' do
      task = Task.new(title: "new project", status: "completed", project: project).save
      expect(task).to eq(false)
    end

    it 'ensures status presence' do
      task = Task.new(title: "new project", description: "sample description", project: project).save
      expect(task).to eq(false)
    end

    it { should define_enum_for(:status).with_values([:draft, :in_process, :completed]) }
  end

  context 'association' do
    it { should belong_to(:project) }

    it do
      should belong_to(:reporter).
        class_name('User').
        with_foreign_key('reporter_id')
    end

    it do
      should belong_to(:assignee).
        class_name('User').
        with_foreign_key('assignee_id')
    end
  end
end
