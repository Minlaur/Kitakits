class ReviewsController < ApplicationController
  before_action :set_user
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
    @review.user = @user
    authorize @review
    if @review.save
      redirect_to sempai_path(@user.id), notice: 'Review was successfully created.'
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
    params.require(:review).permit(:rating, :content)
  end
end
