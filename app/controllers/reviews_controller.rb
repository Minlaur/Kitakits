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
    @reviews = Review.all.where(user: @user).order(created_at: :desc)
    authorize @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to sempais_path(@user) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "user/show", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
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
