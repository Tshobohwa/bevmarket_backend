class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :update, :show]
  def index
    @items = Item.all

    render json: {status:'success', data: {items: @items}}
  end

  def show
    render json: {status: 'success', data: {item: @item}}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @stock_item = StockItem.new(stock_item_params.merge(item_id: @item.id))
      @stock_item.save
      render json: {status: 'success', data: {item: @item, stock_item: @stock_item}}, status: :created
    else
      render json: {status: 'fail', error: {message: "Couldn't create item", error: @item.errors}}, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: {status: 'success', data: {item: @item}}
    else
      render json: {status: 'fail', error: {message: "Couldn't update item", errors: @item.errors}}, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status:'fail', error: {message: 'Item not found'}}, status: :not_found
  end

  def item_params
    params.require(:item).permit(:name, :capacity_unit, :capacity, :bottles_number)
  end

  def stock_item_params
    params.require(:stock_item).permit( :reduction_sale_price, :unit_buy_price, :unit_sale_price, :quantity)
  end
end
