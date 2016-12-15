# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def followed_mail_preview
    UserMailer.followed_mail(user1: User.first, user_who_is_following_user1: User.last)
  end
end
