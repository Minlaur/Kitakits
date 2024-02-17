class UsersController < ApplicationController

  def show
    @sempai = User.find(params[:id])
    @topic = Topic.find_by(id: params[:topic_id])
  end
end
