class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id) # Only show reviews created by the current user
    end
    end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
