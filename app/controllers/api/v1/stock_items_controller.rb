class Api::V1::StockItemsController < ApplicationController
  before_action :find_stock_item, only: [:update, :destroy]
  before_action :update_mode, only: [:update]

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
    case @update_mode
    when 'is_adding_to_stock'
      # Add available quantity to new quantity
      quantity = stock_item_params[:quantity] + @stock_item[:quantity]
      puts "quantity = #{quantity}"

      # set the last unit buy price to the unit buy price of the request
      last_unit_buy_price = stock_item_params[:unit_buy_price]
      puts "last unit buy price = #{last_unit_buy_price}"

      # Calculate the average unit buy price
      # by getting the average between the unit buy price
      # and quantity of the request and those of the database
      average_unit_buy_price = ((stock_item_params[:unit_buy_price] * stock_item_params[:quantity] + @stock_item[:average_unit_buy_price] * @stock_item[:quantity]) / (@stock_item[:quantity] + stock_item_params[:quantity])).round(2)

      if @stock_item.update({quantity: quantity, last_unit_buy_price: last_unit_buy_price, average_unit_buy_price: average_unit_buy_price})
        render json: {status: "success", data: {stock_item: @stock_item}}
      else
        render json: {status: "fail", error: {message: "Couldn't update stock item"}}, status: :unprocessable_entity
      end
    when 'is_updating_price'
      if  @stock_item.update({unit_sale_price: stock_item_params[:unit_sale_price], reduction_sale_price: stock_item_params[:reduction_sale_price]})
        render json: {status: "success", data: {stock_item: @stock_item}}
      else
        render json: {status: "fail", error: {message: "Couldn't update stock item"}}, status: :unprocessable_entity
      end
    else
      render json: {status: "fail", error: {message: "please provide update mode"}}, status: :unprocessable_entity
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
    params.require(:stock_item).permit(:item_id, :reduction_sale_price, :unit_buy_price, :unit_sale_price, :quantity)
  end

  # Select if it is updating the price, or it is adding to stock
  def update_mode
    @update_mode = params[:update_mode]
  end
end
