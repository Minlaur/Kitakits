class BookingsController < ApplicationController
# as a user I can see all bookings I made
def index
  Booking.all
  @bookings = current_user.bookings
end

# I can display a new booking
# def new
#   @booking = Booking.new
#   @topic = Topic.find(params[:topic_id])
#   @booking.topic = @topic
#   # raise
# end





def new
  @booking = Booking.new
  @topic = Topic.find(params[:topic_id])
  @booking.topic = @topic
  if @booking.save
    redirect_to booking_path(@booking) # Modify redirect path to include booking ID
  else
    render :new, status: :unprocessable_entity
   end
  # raise
end


def update
  # @booking = Booking.find(params[:id])
  # if @booking.update(booking_params)
  #   redirect_to new_topic_booking_path(@booking), notice: "Booking was successfully updated!"
  # else
  #   render :new, status: :unprocessable_entity
  # end
  if @booking.update
  redirect_to booking_path(@booking), notice: "Booking was successfully updated!"
  else
    render :new, status: :unprocessable_entity
  end
end


def create
  @topic = Topic.find(params[:topic_id])
  #raise
  @booking = Booking.new(booking_params)
  @booking.topic = @topic
  if @booking.save
  redirect_to booking_path(@booking) # Modify redirect path to include booking ID
  else
    render :new, status: :unprocessable_entity
   end
end



# I can create a new booking

# I can see the details of a booking
def show
  @booking = Booking.find(params[:id])
  @topic = @booking.topic
  @message = Message.new
end
# accept or reject the booking by clicking on a button




private

  def booking_params
    params.require(:booking).permit(:status, :time, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
