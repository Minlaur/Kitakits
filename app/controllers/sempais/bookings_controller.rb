class Sempais::BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user: current_user)
    @user = current_user # or however you are retrieving the user
  end

  def show
    @booking = Booking.find(params[:id])
    @topic = @booking.topic
    @user = @booking.user
    authorize @booking
  end

end
