class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @sempai = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
  end

  def update
    @user = User.find(params[:id])
    # should be the current user's timezone.
    @user.update(last_seen: Time.zone.now)
    head :ok
  end
end
