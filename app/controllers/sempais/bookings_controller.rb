class Sempais::BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
