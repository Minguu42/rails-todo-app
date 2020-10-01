class Task < ApplicationRecord
  belongs_to :project

  default_scope -> {order(created_at: :desc)}

  validates :name, presence: true, length: {maximum: 50}
end
