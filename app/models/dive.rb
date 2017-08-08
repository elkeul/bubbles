class Dive < ApplicationRecord
  validates_presence_of :location, length: { minimum: 1 }
  validates :dive_number, presence: true
  validates :dive_date, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :time_in, presence: true
  validates :time_out, presence: true
  validates :depth, presence: true

  belongs_to :diver
  has_and_belongs_to_many :dive_types
end
