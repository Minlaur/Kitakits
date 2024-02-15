class MessagesController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
  end

  def create
    @booking = Booking.find(params[:id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    if @message.save
      redirect_to booking_messages_path(@booking)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
