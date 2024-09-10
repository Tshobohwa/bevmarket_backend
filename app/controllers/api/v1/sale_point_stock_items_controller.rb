class Api::V1::SalePointStockItemsController < ApplicationController
  def index
    @sale_point_stock_items = SalePointStockItem.all

    render json: {status: "success", data: {sale_point_stock_items: @sale_point_stock_items}}
  end

  def create
    @sale_point_stock_item = SalePointStockItem.new(sale_point_stock_item_params)

    if @sale_point_stock_item.save
      render json: {status: "success", data: {sale_point_stock_item: @sale_point_stock_item}}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create sale point stock item"}}, status: :unprocessable_entity
    end
  end

  private

  def sale_point_stock_item_params
    params.require(:sale_point_stock_item).permit(:stock_item_id, :sale_point_id, :quantity)
  end
end
