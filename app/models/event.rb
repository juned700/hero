class Event < ApplicationRecord
  validates :name, :place, :event_date, :spot, :image_file_name, presence: true

  validates :spot, numericality: { only_integer: true }
end
