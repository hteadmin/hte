# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def notify_order
    UserMailer.notify_order(Order.last)
  end
end
