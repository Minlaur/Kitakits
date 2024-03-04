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
      # redirect_to user_topics_path(current_user)
      respond_to do |format|
        format.html { redirect_to user_topics_path(current_user) }
        # format.text { render partial: "topics", locals: { topic: @topic }, formats: [:html] }
        format.text { render "/topics/index", locals: { topic: @topic }, formats: [:html] }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @topic = Topic.new
    statuses = [ 'pending', 'resolved', 'cancelled' ]
    @sorted_topics = policy_scope(Topic).where(user_id: @user.id).sort_by { |topic| statuses.index(topic.status)}
    @sempais_by_topic = {}
    # needed to find sempais under this topic, _by_ is an association extension in Active Record / Rails
    @sorted_topics.each do |topic|
      tags = topic.name.split(" ") + topic.description.split(" ")
      tagged_sempais = User.where(sempai: true).tagged_with(tags, any: true)
      @sempais_by_topic[topic] = tagged_sempais.reject { |sempai| sempai == @user }
    end
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
    params.require(:topic).permit(:name, :description, :note).merge(user_id: current_user.id)
    # .merge; assuming we can submit a topic if signed in? .merge(user_id: current_user.id, status: "pending")
  end

  def set_user
    @user = current_user
  end
end
