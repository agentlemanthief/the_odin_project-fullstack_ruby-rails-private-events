class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end


  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = 'Event successfully saved!'
      redirect_to @event
    else
      flash[:notice] = 'Event could not be saved!'
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:start, :end, :location, :description)
  end
end
