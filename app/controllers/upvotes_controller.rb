class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    puts "==========================+++++++++++++++++++=#{@review.id}"
    puts "==========================+++++++++++++++++++=#{current_user.username}"

    # Upvote.create({user_id: current_user.id, review_id: @review.id})
    current_user.upvote(@review)

    respond_to do |format|
      format.html { redirect_to :back}
      format.js {}
    end
    
  end
  
end
