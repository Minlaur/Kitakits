class MessagesController < ApplicationController
  before_action :authenticate_user!

  def def new
    @message = Message.new
  end


  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    authorize @message
    if @message.save
      BookingChannel.broadcast_to(
        @booking,
        render_to_string(partial: "message", locals: {message: @message})
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
