class TopicsController < ApplicationController
before_action :set_user

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  def show
    # find the record of topic and sets it to @topic
    @topic = Topic.find(params[:id])
    # finds the record of users and sets it as @sempais
    tags = @topic.name.split(" ") + @topic.description.split(" ")
    @sempais = User.where(sempai: true).tagged_with(tags, any: true)
    authorize @topic
    # @sempais = User.where(sempai: true).tagged_with([@topic.where(params[:query])], on: :expertises, any: true)
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topics = Topic.all
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update(topic_params)
      redirect_to topics_path
      # once we have the requests#index to include params[:mine],change to redirect_to topics_path(mine: true)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @topics = policy_scope(Topic).where(user_id: @user.id)
    @topic = Topic.find(params[:user_id])
    tags = @topic.name.split(" ") + @topic.description.split(" ")
    @sempais = User.where(sempai: true).tagged_with(tags, any: true)
  end
  # def matching_sempais
  #   # find the record of topic and sets it to @topic
  #   @topic = Topic.find(params[:id])
  #   # finds the record of users and sets it as @sempais
  #   tags = @topic.name.split(" ") + @topic.description.split(" ")
  #   @sempais = User.where(sempai: true).tagged_with(tags, any: true)
  #   # @sempais = User.where(sempai: true).tagged_with([@topic.where(params[:query])], on: :expertises, any: true)
  # end

  def resolved
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update(status: 'resolved')
      redirect_to user_topics_path(@topic), notice: 'Your topic is resolved.'
    else
      render :show, alert: 'Failed to resolve topic.', status: :unprocessable_entity
    end
  end

  def cancelled
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update(status: 'cancelled')
          # need to suggest leaving a review
      redirect_to user_topics_path(@topic), notice: 'Your topic is cancelled.'
    else
      render :show, alert: 'Failed to cancel topic.', status: :unprocessable_entity
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description).merge(user_id: current_user.id)
    # .merge; assuming we can submit a topic if signed in? .merge(user_id: current_user.id, status: "pending")
  end

  def set_user
    @user = current_user
  end
end
