class BookingsController < ApplicationController
  before_action :set_topic

# as a user I can see all bookings I made
def index
  Booking.all
  @bookings = current_user.bookings
end

# I can display a new booking
def new
  @booking = Booking.new
  @booking.topic = @topic
  authorize @booking
end

# I can create a new booking
def create
  # raise
  @booking = Booking.new(booking_params)
  @booking.topic = @topic
  # raise
  authorize @booking
  if @booking.save
    redirect_to topic_booking_path(topic_id: @topic.id, id: @booking.id), notice: "Booking was successfully created!" # Modify redirect path to include booking ID and add notice
  else
    render :new, status: :unprocessable_entity
  end
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


# I can see the details of a booking
def show
  @booking = Booking.find(params[:id])
  @topic = @booking.topic
  @message = Message.new
  authorize @booking
end
# accept or reject the booking by clicking on a button

private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :time, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
