class DiveType < ApplicationRecord
  validates_presence_of :activity, length: { minimum: 1 }

  has_and_belongs_to_many :dives
end
