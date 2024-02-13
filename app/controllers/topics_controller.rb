class TopicsController < ApplicationController

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to @topic
      # should update, redirect to the recommended sempais path
    else
      render 'pages/home', status: :unprocessable_entity
    end
  end

  def show
    @topic = Topic.find(params[:id])
    # currently built and will conflict here, update with Martin's
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topics = Topic.all
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path
      # once we have the requests#index to include params[:mine],change to redirect_to topics_path(mine: true)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :tag_id)
    # .merge; assuming we can submit a topic if signed in? .merge(user_id: current_user.id, status: "pending")
  end
end
