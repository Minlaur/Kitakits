class BookingsController < ApplicationController
# as a user I can see all bookings I made
def index
  Booking.all
end

# I can display a new booking
def new
  @booking = Booking.new
  @topic = Topic.find_by(id: params[:topic_id])
  # @user = current_user.id
  @booking.topic = @topic
end

def create
  @booking = Booking.new(booking_params)
  @topic = Topic.find(params[:topic_id])
  @booking.topic = @topic
  if @booking.save
    # raise
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
end
# accept or reject the booking by clicking on a button


private

  def booking_params
    params.require(:booking).permit(:status, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
