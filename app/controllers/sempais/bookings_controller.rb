class Sempais::BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
    @topic = @booking.topic
    @user = @booking.user
    authorize @booking
  end

end
