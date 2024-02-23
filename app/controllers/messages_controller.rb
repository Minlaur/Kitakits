class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.booking = @booking
    @message.user = current_user
    authorize @message
    if @message.save
      redirect_to booking_path(@booking)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image)
  end
end
