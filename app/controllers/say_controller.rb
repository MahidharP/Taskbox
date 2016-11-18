class SayController < ApplicationController
  #load_and_authorize_resource

  authorize_resource class: false
  def hello
  end
  def goodbye
  end
  def products
  	@products = ["marker", "pencil", "box", "sketch pen"]
  end
  def category1
  	@category1 = Category1.all
  end
  def product
  	@product = Product.all 
  end 
  def product1
    @product1 = Product1.all
    @in_stock_products = Product1.where('in_stock = ?', true)
  end  
  def order
    @order = Product1.price.order
  end  
  def in_stock
    @in_stock 
  end 
  def avail
    @avail = Product1.all
  end 
 end  
