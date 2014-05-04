class AdminMailer < ActionMailer::Base

  def notify_order(order)
    @order = order
    recipients = AdminUser.pluck(:email)
    mail(:to => recipients, :subject => t('email_notify_order.subject', number: @order.number))
  end

  def notify_pre_order(pre_order)
    @pre_order = pre_order
    recipients = AdminUser.pluck(:email)
    mail(:to => recipients, :subject => t('email_notify_pre_order.subject'))
  end

  def notify_order_ending(orders)
    @orders = orders
    recipients = AdminUser.pluck(:email)
    mail(:to => recipients, :subject => t('email_notify_order_ending.subject'))
  end

end
