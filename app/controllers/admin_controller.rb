class AdminController < ApplicationController
  
  before_action :signed_in_user, only: [:order, :echart]
  before_action :admin_user, only: [:order, :echart]

  def echart
      items = OrderItem.all
      @data = Hash.new
      items.each do |item|
          type = item.product.category.to_s
          if @data.include?(type)
              @data[type] += 1
          else
              @data[type] = 1
          end
      end
  end

  def sale
      @orders = Order.all
  end
end
