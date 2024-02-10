class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
      # should update, redirect to the recommended sempais path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description)
  end
end
