class UserMailer < ApplicationMailer
  default from: "srijal.joshy@gmail.com"

  def followed_mail(user1:, user_who_is_following_user1:) 
    # usage followed_mail(user, current_user)
    @user1, @user2 = user1, user_who_is_following_user1
    mail(to: @user1.email, subject: "You have been followed")
  end
end
