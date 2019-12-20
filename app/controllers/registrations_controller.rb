class RegistrationsController < ApplicationController

  before_action :set_event
  before_action :check_spot_available, only: [:new]

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)

    if @registration.save
      flash[:notice] = 'You have successfully registered for Event.'
      redirect_to event_registrations_path(@event)
    else
      render :new
    end
  end

  private

    def registration_params
      params.require(:registration).permit(:name, :email, :how_heard)
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def check_spot_available
      if @event.sold_out?
        flash[:error] = 'No Spot Available.'
        redirect_to event_path(@event) and return
      end
    end
end
