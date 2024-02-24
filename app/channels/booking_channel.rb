class BookingChannel < ApplicationCable::Channel
  def subscribed
    if params[:id]
      chatroom = Booking.find_by(id: params[:id])
      if chatroom
        stream_for chatroom
      else
        # Handle case where Booking with given ID is not found
        # You can send an error message or perform other actions
        reject
      end
    else
      # Handle case where params[:id] is not provided
      # You can send an error message or perform other actions
      reject
    end
  end

  def unsubscribed
  end
end
