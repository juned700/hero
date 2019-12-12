class Event < ApplicationRecord
  validates :name, :place, :event_date, :spot, :image_file_name, presence: true

  validates :spot, numericality: { only_integer: true }

  def self.upcoming
    where("event_date >= ?", Time.now).order('event_date')
  end

  def self.past
    where("event_date < ?", Time.now).order('event_date DESC')
  end

end
