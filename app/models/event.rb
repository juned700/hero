class Event < ApplicationRecord

  def self.upcoming
    where("event_date >= ?", Time.now).order('event_date')
  end

  def self.past
    where("event_date < ?", Time.now).order('event_date DESC')
  end

end
