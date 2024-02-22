class UsersController < ApplicationController
  before_action :authenticate_user!
  # ,:set_time_zone

  def show
    @user = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
    authorize @user
  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    puts "is it working?"
    # should be the current user's timezone. Define in the application controller
    # This works but not in rails c ~ @user.update_columns(last_seen: Time.zone.now)
    # This works also but not in rails c
    @user.update_without_password(last_seen: [Time.zone.now, params[:user][:last_seen]])

    puts "update working till end"
    @user.save
    puts "record saved"
    head :ok
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end
end
