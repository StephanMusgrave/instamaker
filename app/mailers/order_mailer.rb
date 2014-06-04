class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

def successful_order(order)
  @order = order
  mail(to: @order.user.email, subject: 'Thanks for your order')
end



end
