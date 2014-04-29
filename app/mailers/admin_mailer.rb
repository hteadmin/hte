class AdminMailer < ActionMailer::Base

  def notify_order(order)
    @order = order
    recipients = AdminUser.pluck(:email)
    mail(:to => recipients, :subject => t('email_notify_order.subject', number: @order.number))
  end

end
