class UsersController < ApplicationController
  def show
    @user = User.includes(:reviews).find(params.fetch(:id)) #better way to fetch from the hash to prevent nil:NilClass error
  end
end
