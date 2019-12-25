class Event < ApplicationRecord
  has_many :registrations
  
  validates :name, :place, :event_date, :spot, :image_file_name, presence: true

  validates :spot, numericality: { only_integer: true }

  # Class method
  def self.upcoming
    where("event_date >= ?", Time.now).order('event_date')
  end

  def self.past
    where("event_date < ?", Time.now).order('event_date DESC')
  end

  def sold_out?
    availability = spot - registrations.persisted_records.size
    availability.zero? || availability < 0
  end

end
