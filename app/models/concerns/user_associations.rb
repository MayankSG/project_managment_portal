module UserAssociations
  extend ActiveSupport::Concern

  included do
    has_many :project_assignments, dependent: :destroy
    has_many :projects, through: :project_assignments
    has_many :reported_tasks, class_name: 'Task', foreign_key: :reporter_id
    has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id
  end
end