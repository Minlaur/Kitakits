class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    user.present? # Anyone can create a booking
  end

  def show?
    true # Anyone can view a booking
  end

  def update?
    return true if user.present? && user == booking.user
  end

  def accepted?
    true
  end

  def rejected?
    true
  end
end
