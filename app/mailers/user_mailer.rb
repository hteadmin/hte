class UserMailer < ActionMailer::Base

  def notify_order(order)
    @order = order
    mail(:to => order.email, :subject => t('email_notify_order.subject', number: @order.number))
  end

end
