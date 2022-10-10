class User < ApplicationRecord
  include UserAssociations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
end
