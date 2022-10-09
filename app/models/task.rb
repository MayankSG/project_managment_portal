class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  belongs_to :project
  belongs_to :reporter, class_name: 'User', foreign_key: :reporter_id
  belongs_to :assignee, class_name: 'User', foreign_key: :assignee_id

  enum :status, %i(draft in_process completed)
end
