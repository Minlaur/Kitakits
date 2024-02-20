class BookingsController < ApplicationController
# as a user I can see all bookings I made
def index
  Booking.all
end

# I can display a new booking
def new
  @booking = Booking.new
  @topic = Topic.find(params[:topic_id])
  @booking.topic = @topic
  authorize @booking
  # raise
end

# I can create a new booking
def create
  @topic = Topic.find(params[:topic_id])
  # raise
  @booking = Booking.new(booking_params)
  @booking.topic = @topic
  authorize @booking
  if @booking.save
    redirect_to booking_path(@booking) # Modify redirect path to include booking ID
  else
    render :new, status: :unprocessable_entity
  end
end

# I can see the details of a booking
def show
  @booking = Booking.find(params[:id])
  @topic = @booking.topic
  @message = Message.new
  authorize @booking
end
# accept or reject the booking by clicking on a button


private

  def booking_params
    params.require(:booking).permit(:status, :time, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
