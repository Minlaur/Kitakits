class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @sempai = User.find(params[:id])
    @booking = Booking.create
    @message = Message.new
    @topic= Topic.find_by(id: params[:topic_id])
  end
end
