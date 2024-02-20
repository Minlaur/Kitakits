class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true # Anyone can view a topic
  end

  def create?
    user.present? # Anyone can create a topic
  end

end
