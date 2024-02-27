class BookingsController < ApplicationController
  before_action :set_topic, except: [:accepted, :rejected]

# as a user I can see all bookings I made
def index
  Booking.all
  @bookings = current_user.bookings
end

def new
  @booking = Booking.new
  @booking.topic = @topic
  authorize @booking
end


def create

  @booking = Booking.new(booking_params)
  @booking.topic = @topic

  authorize @booking
  if @booking.save
    redirect_to topic_booking_path(topic_id: @topic.id, id: @booking.id), notice: "Booking was successfully created!" # Modify redirect path to include booking ID and add notice
  else
    render :new, status: :unprocessable_entity
  end
end


def update
  if @booking.update
  redirect_to booking_path(@booking), notice: "Booking was successfully updated!"
  else
    render :new, status: :unprocessable_entity
  end
end


def show
  @booking = Booking.find(params[:id])
  @topic = @booking.topic
  @messages = Message.new
  authorize @booking
end


def accepted
  @booking = Booking.find(params[:id])
  authorize @booking
  if @booking.update(status: 'accepted')
    redirect_to sempais_user_booking_path(@booking), notice: 'Booking was accepted.'
  else
    redirect_to sempais_user_booking_path(@booking), alert: 'Failed to accept booking.'
  end
end

def rejected
  @booking = Booking.find(params[:id])
  authorize @booking
  if @booking.update(status: 'rejected')
    redirect_to sempais_user_booking_path(@booking), notice: 'Booking was rejected.'
  else
    redirect_to sempais_user_booking_path(@booking), alert: 'Failed to reject booking.'
  end
end



private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :time, :topic_id).merge(user_id: current_user.id, status: "pending")
  end
end
