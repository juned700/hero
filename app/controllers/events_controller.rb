class EventsController < ApplicationController
  #before_action :get_event, only: [:show, :edit, :update, :destroy]
  before_action :get_event, excpet: [:new, :create, :index]

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
    def get_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :price, :place, :event_date, :description, :image_file_name, :spot)
    end
end
