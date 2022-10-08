class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true

  has_many :project_assignments, dependent: :destroy
  has_many :users, through: :project_assignments
  has_many :tasks

  enum :status, %i(draft in_process completed)
end
