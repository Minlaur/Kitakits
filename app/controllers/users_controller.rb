class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @topic = Topic.find_by(id: params[:topic_id])
    @booking = Booking.create
    @message = Message.new
    @review = Review.new(user_id: @user.id)
    @reviews = @user.reviews
    authorize @user
  end
end
