class OrdersController < ApplicationController
  
  def index
    authenticate_admin!
    @orders = order.all
  end

end
