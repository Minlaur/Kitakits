class BookingsController < ApplicationController
# as a user I can see all bookings I made
def index
  Booking.all
end

# I can display a new booking
def new
  @booking = Booking.new
  @topic = Topic.find(params[:topic_id])
  @user = current_user.id
  @booking.topic = @topic
end
# I can create a new booking
def create
  @booking = Booking.new(booking_params)
    @topic = Topic.find(params[:topic_id])
    @booking.topic = @topic
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
end

# accept or reject the booking by clicking on a button


private

  def booking_params
    params.require(:booking).permit(:status, :created_at, :updated_at, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
