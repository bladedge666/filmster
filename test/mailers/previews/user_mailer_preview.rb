# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def followed_mail_preview
    UserMailer.followed_mail(User.first, User.last)
  end
end
