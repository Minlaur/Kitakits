class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:show, :create, :matching_sempais]

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      # @topic = Topic.find(params[:topic_id])
      redirect_to @topic
      # should update, redirect to the recommended sempais path
    else
      render 'pages/home', status: :unprocessable_entity
    end
  end

  def show
    # @topic = Topic.find(params[:topic_id])
    matching_sempais
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

  def matching_sempais
    # find the record of topic and sets it to @topic
    @topic = Topic.find(params[:id])
    # finds the record of users and sets it as @sempais
    tags = @topic.name.split(" ") + @topic.description.split(" ")
    @sempais = User.where(sempai: true).tagged_with(tags, any: true)
    # @sempais = User.where(sempai: true).tagged_with([@topic.where(params[:query])], on: :expertises, any: true)
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :tag_id)
    # .merge; assuming we can submit a topic if signed in? .merge(user_id: current_user.id, status: "pending")
  end
end
