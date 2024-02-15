class BookingsController < ApplicationController
# as a user I can see all bookings I made
def index
  Booking.all
end

# I can display a new booking
def new
  @booking = Booking.new
end
# I can create a new booking

end
