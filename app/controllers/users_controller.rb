class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
    @review = Review.new(user_id: @user.id)
    @reviews = @user.reviews
    authorize @user
  end
end
