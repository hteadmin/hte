class UserMailer < ActionMailer::Base

  def notify_order(order)
    @order = order
    mail(:to => order.email, :subject => t('email_notify_order.subject', number: @order.number))
  end

  def notify_pre_order(pre_order)
    @pre_order = pre_order
    mail(:to => pre_order.email, :subject => t('email_notify_pre_order.subject'))
  end

end
