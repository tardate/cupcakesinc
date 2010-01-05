class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
  end
  
  def show
    @order_item = OrderItem.find(params[:id])
  end
  
  def new
    @order_item = OrderItem.new
  end
  
  def create
    @order_item = OrderItem.new(params[:order_item])
    if @order_item.save
      flash[:notice] = "Successfully created order item."
      redirect_to @order_item
    else
      render :action => 'new'
    end
  end
  
  def edit
    @order_item = OrderItem.find(params[:id])
  end
  
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update_attributes(params[:order_item])
      flash[:notice] = "Successfully updated order item."
      redirect_to @order_item
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    flash[:notice] = "Successfully destroyed order item."
    redirect_to order_items_url
  end
end
