class ReviewsController < ApplicationController
  before_action :set_user, except: [:create]
  before_action :set_reviews, only: [:index]

  def index
    @reviews = policy_scope(Review)
  end




  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @reviews = Review.all.where(user: @user).order(created_at: :desc)
    authorize @review
    if @review.save
      redirect_to user_topics_path(current_user)

    else
      head :ok, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_reviews
    @reviews = @user.reviews
  end

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
end
