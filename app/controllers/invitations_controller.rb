class InvitationsController < ApplicationController
  def attend
    @event = Event.find(params[:id])

    if @event.attendees.include?(current_user.id)
      redirect_to @event, notice: 'You are already attending'
    else
      @event.attendees << current_user.id
    end
  end
end
