class UsersController < ApplicationController
  before_action :authenticate_user!
  # ,:set_time_zone


    # Create a booking associated with the user
    def show
    @user = User.find(params[:id])
    @topic = Topic.find_by(id: params[:topic_id])

    # Create a new booking associated with the user and topic and save it
    if params[:booking_id].present?
      @booking = Booking.find(params[:booking_id])
      @messages = @booking.messages
      authorize @messages
    else
      # Handle the case where booking_id is not present or invalid
      @booking = Booking.create(user: current_user, topic: @topic, status: "pending", user_id: @user.id)
      @message = Message.new
    end

    @review = Review.new(user_id: @user.id)
    @reviews = @user.reviews

    authorize @user

    end


  def update
    # @user = User.find(params[:id])
    @user = current_user
    # below is the record for update? in UserPolicy
    authorize @user
    puts "is it working?"
    # should be the current user's timezone. Define in the application controller
    # This works but not in rails c ~ @user.update_columns(last_seen: Time.zone.now)
    # This works also but not in rails c
    @user.update_attribute(:last_seen, Time.zone.now)
    puts "update working till end"
    @user.save
    puts "record saved"
    head :ok
  end
end
