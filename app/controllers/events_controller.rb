class EventsController < ApplicationController
  def index
    @events = ['Rails Training', 'Ruby Training', 'SQL Training', 'Rails Hackthon']
  end
end
