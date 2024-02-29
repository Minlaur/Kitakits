class BookingsController < ApplicationController
  before_action :set_topic, except: [:accepted, :rejected, :update, :show, :index, :new, :create, :edit]

# as a user I can see all bookings I made
def index
  @bookings = policy_scope(Booking)
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
    if @booking.time.present?
      render "bookings/confirmation_page"
    else
      redirect_to sempais_path(@user), notice: "Register a date and time"
    end
    # redirect_to sempais_path(@user), notice: "Booking was successfully created!" # Modify redirect path to include booking ID and add notice
  else
    render :new, status: :unprocessable_entity
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
      render "bookings/confirmation_page", notice: "Booking was successfully updated!"
    else
      redirect_to user_topic, notice: "Register a date and time"
    end
  else
    render :edit, status: :unprocessable_entity
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
    params.require(:booking).permit(:status, :time, :topic_id, :user_id).merge(status: "pending")
  end
end
