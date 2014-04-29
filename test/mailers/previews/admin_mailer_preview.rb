# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class AdminMailerPreview < ActionMailer::Preview
  def notify_order
    AdminMailer.notify_order(Order.last)
  end

  def notify_order_ending
    AdminMailer.notify_order_ending(Order.about_to_end)
  end
end
