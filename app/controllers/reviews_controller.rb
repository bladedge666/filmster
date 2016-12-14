class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :create  

  def create
    @movie = MovieBuilder.new(imdbid: params[:imdbid]).build!

    # create a new review and connect it to the current_user and the movie
    @review = current_user.reviews.new(review_params.merge(movie: @movie))

    if @review.save
      flash[:success] = "Review saved!"
    else
      flash[:alert] = "Woops! It seems there was an error."
    end

    # redirect_to @movie
    redirect_to :controller => "movies", :action => "show", :id => params[:imdbid]
    
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    imdbid = @review.movie_imdbid # make sure to delegate this

    if @review.destroy
      flash[:danger] = "Review deleted!"
    end
    # redirect_to :back
    redirect_to "/movies/#{imdbid}"
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end