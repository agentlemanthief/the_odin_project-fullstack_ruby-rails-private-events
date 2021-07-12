class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def attend
    @event = Event.find(params[:id])

    if @event.attendees.include?(current_user)
      redirect_to @event, notice: 'You are already attending'
    else
      @event.attendees << current_user
      redirect_to @event, notice: 'You are now attending this event!'
    end
  end

  def cancel_attend
    @event = Event.find(params[:id])
    @user = current_user

    @event.attendees.delete(@user)

    redirect_to @event, alert: 'Attendance cancelled!'
  end
end
