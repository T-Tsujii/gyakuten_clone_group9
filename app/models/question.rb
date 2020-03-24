class Question < ApplicationRecord
  has_many :solutions
  validates :title, presence: true
end
