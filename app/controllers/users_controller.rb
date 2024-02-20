class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
    authorize @user
  end
end
