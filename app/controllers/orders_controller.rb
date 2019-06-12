class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.to_json
  end

  def show
    order = Order.find(params[:id])
    render json: order.to_json
  end

  def update
    order = Order.find(params[:id])
    order.amount = order_params[:amount]
    order.save!
    render json: order.reload
  end

  def create
    order = Order.create(amount: create_params[:amount])

    render json: order
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy

    render json: order
  end

  def order_params
    params.permit(:id, :amount)
  end

  def create_params
    params.require(:order).permit(:id, :amount)
  end
end















