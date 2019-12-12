class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]
  #before_action :get_event, excpet: [:new, :create, :index]

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event has successfully updated!'
    else
      flash.now[:error] = "Some error occured!"
      render :edit
    end
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: 'Event has successfully created!'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event has been successfully deleted!'
  end

  private
    def get_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :price, :place, :event_date, :description, :image_file_name, :spot)
    end
end
