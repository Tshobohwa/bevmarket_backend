class Api::V1::StockItemsController < ApplicationController
  before_action :find_stock_item, only: [:update, :destroy]

  # GET api/v1/stock_items
  def index
    @stock_items = StockItem.includes(:item).all

    render json: {status: 'success', data: {stock_items: @stock_items.as_json(include: :item)}}
  end

  # GET api/v1/stock_items/:id
  def show
    render json: {status: "success", stock_item: @stock_item}
  end

  # POST api/v1/stock_items
  def create
    @stock_item = StockItem.new(stock_item_params)

    if @stock_item.save
      render json: {status: 'success', data: {stock_item: @stock_item}}, status: :created
    else
      render json: {status: 'fail', error: {message: "Couldn't create stock item"}}, status: :unprocessable_entity
    end
  end

  # UPDATE api/v1/stock_items/:id
  def update
    if @stock_item.update(stock_item_params)
      render json: {status: "success", data: {stock_item: @stock_item}}
    else
      render json: {status: "fail", error: {message: "Couldn't update stock item"}}, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/stock_items
  def destroy
    @stock_item.destroy
  end

  private

  def find_stock_item
    puts "request id #{params[:id]}"
    @stock_item = StockItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {status: "fail", error: { message: "Couldn't find stock item" } }, status: :not_found
  end

  def stock_item_params
    params.require(:stock_item).permit(:item_id, :average_unit_buy_price, :reduction_sale_price, :last_unit_buy_price, :unit_sale_price, :quantity)
  end
end
