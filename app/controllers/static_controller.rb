class StaticController < ApplicationController
  def index
    @movies = Movie.recent
    @recent_reviews = Review.recent
  end
end
