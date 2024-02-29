class UsersController < ApplicationController
  before_action :authenticate_user!
  # ,:set_time_zone


    # Create a booking associated with the user
    def show
      @user = User.find(params[:id])
      @topic = Topic.find_by(id: params[:topic_id])
      @booking = current_user.bookings.find_or_initialize_by(topic: @topic, status: "pending")
      @messages = @booking.messages if @booking.persisted?
      @message = Message.new unless @booking.persisted?
      @review = Review.new(user_id: @user.id)
      @reviews = @user.reviews
      authorize @user
    end



  def update
    # @user = User.find(params[:id])
    @user = current_user
    # below is the record for update? in UserPolicy
    authorize @user
    # should be the current user's timezone. Define in the application controller
    # This works but not in rails c ~ @user.update_columns(last_seen: Time.zone.now)
    # This works also but not in rails c
    @user.update_attribute(:last_seen, Time.zone.now)
    @user.save
    head :ok
  end
end
