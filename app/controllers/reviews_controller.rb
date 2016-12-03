class ReviewsController < ApplicationController
  before_action :authenticate_user!  

  def create
    @movie = MovieBuilder.new(imdbid: params[:imdbid]).build!
    
    # create a new review and connect it to the current_user and the movie
    @review = current_user.reviews.new(review_params.merge(movie: @movie))

    if @review.save
      flash[:success] = "Review saved!"
    else
      flash[:alert] = "Woops! It seems there was an error."
    end

    redirect_to root_path
    
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end