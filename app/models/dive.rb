class Dive < ApplicationRecord
  validates_presence_of :location, length: { minimum: 1 }
  # validates :dive_number, presence: true
  validates :dive_date, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :time_in, presence: true
  validates :time_out, presence: true
  validates :depth, presence: true

  belongs_to :diver
  has_and_belongs_to_many :dive_types

  after_create :increment_dive_number
  after_create :increment_bottom_time

  private

  def increment_dive_number
    self.diver.last_dive_number += 1
    self.diver.save
  end

  def increment_bottom_time
    self.diver.total_bottom_time += self.bottom_time
    self.diver.save
  end
end
