class BookingsController < ApplicationController
  before_action :set_topic, only: [:new, :create, :show, :index]

# as a user I can see all bookings I made
def index
  @bookings = Booking.where(user_id: current_user)
  authorize @bookings
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
      redirect_to topic_booking_path(@booking.topic, @booking)
  else
    head :unprocessable_entity
  end
end

def edit
  @booking = Booking.find(params[:id])
  authorize @booking
end

def update
  @booking = Booking.find(params[:id])
  authorize @booking

  if @booking.update(booking_params)
    if @booking.time.present?
      redirect_to topic_booking_path(@booking)
    end
  else
    render :edit, status: :unprocessable_entity
  end
end


def show
  @booking = Booking.find_by(id: params[:id])
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
    params.require(:booking).permit(:status, :time, :user_id, :topic_id ).merge(status: "pending")
  end
end
