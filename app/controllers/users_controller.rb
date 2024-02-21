class UsersController < ApplicationController
  before_action :authenticate_user!
  # ,:set_time_zone

  def show
    @sempai = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
  end

  # need to set the time zone for users controller
  # def set_time_zone
  #   #current user is a devise method see https://github.com/plataformatec/devise
  #   Time.zone = current_user.Time.zone if current_user
  # end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    # should be the current user's timezone. Define in the application controller
    @user.update(last_seen: Time.zone.now)
    head :ok
  end
end
