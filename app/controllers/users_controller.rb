class UsersController < ApplicationController

  def show
    @sempai = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
  end

end
