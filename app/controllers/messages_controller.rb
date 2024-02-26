class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Ensure that params[:booking_id] is present and not nil
    @topic = Topic.find(params[:topic_id])
    if params[:booking_id].present?
      @booking = Booking.find(params[:booking_id])
      @messages = @booking.messages
      authorize @messages
    else
      # Handle the case where booking_id is not present or invalid
      @booking = Booking.new(user: current_user, topic: @topic.id)
      @booking.save
    end
  end

  def new
    @message = Message.new
  end


  def create
    if params[:booking_id].present?
      @booking = Booking.find(params[:booking_id])
      @message = @booking.messages.build(message_params)
    else
      # Handle the case where booking_id is not present or invalid
      # You might want to add further logic based on your requirements
      @message = Message.new(message_params)
      @message.build_booking(user: current_user, topic: @topic) # assuming @topic is defined
    end

    @message.user = current_user
    authorize @message

    if @message.save
      BookingChannel.broadcast_to(
        @booking,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "users/show", status: :unprocessable_entity
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
