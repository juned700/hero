class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_event, only: [:create, :destroy]


  def create
    like = @event.likes.new(user_id: current_user.id)
    if like.save
      redirect_to events_path, notice: 'You have successfully like this event.'
    end
  end

  def destroy
    like = @event.likes.find(params[:id])
    like.destroy
    redirect_to events_path, notice: 'You have successfully unlike this event.'
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end
end
