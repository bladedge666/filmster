class UsersController < ApplicationController
  def show
    @user = User.includes(:reviews).find(params.fetch(:id)) #better way to fetch from the hash to prevent nil:NilClass error
  end

  def timeline
    @reviews = Review.where(user: current_user.following_users).order("created_at DESC")
  end
end
