class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :project_assignments, dependent: :destroy
  has_many :users, through: :project_assignments

  enum :status, %i(draft in_process completed)
end
