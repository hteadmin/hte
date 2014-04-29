namespace :order do
  desc 'Send order ending remind email'
  task :remind => :environment do
    orders = Order.about_to_end
    if orders.any?
      puts "Notify order #{orders.map {|o| o.number}.join(',')}"
      AdminMailer.notify_order_ending(orders).deliver
    end
  end
end