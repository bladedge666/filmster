class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower, :followed, presence: true
  validates :followed_id, uniqueness: {scope: :follower_id}

  # after_create :send_email

  # private

  # def send_email
  #   UserMailer.followed_mail(user1: @user, user_who_is_following_user1: current_user).deliver_later
  # end

end
