class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def create
    current_user.follow(@user)
    # UserMailer.followed_mail(@user, current_user).deliver_later ---- We used the model for after_create callback

    respond_to do |format|
      format.html { redirect_to @user}
      format.js {}
    end
  end 

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js {}
    end
  end

  private

  def check_user
    @user = User.find(params[:user_id])
    return unless @user == current_user
    flash[:alert] = "You cannot follow yourself"
    redirect_to @user  
  end

end
