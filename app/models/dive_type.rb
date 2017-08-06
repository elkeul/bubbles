class DiveType < ApplicationRecord
  validates_presence_of :activity, length: { minimum: 1 }
  # validates :body, presence: true
  # belongs_to :user
end
