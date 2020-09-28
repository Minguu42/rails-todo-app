class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 200}
end
