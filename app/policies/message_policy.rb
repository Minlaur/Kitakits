class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true # Anyone can view a list of messages
  end

  def create?
    user.present? # Anyone can create a message
  end

  def show?
    true # Anyone can view a message
  end

end
