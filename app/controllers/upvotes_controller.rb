class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])

    current_user.upvotes.create(review_id: @review.id)

    respond_to do |format|
      format.html { redirect_to :back}
      format.js {}
    end
    
  end
  
end
