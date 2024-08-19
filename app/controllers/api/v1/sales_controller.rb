class Api::V1::SalesController < ApplicationController
  # GET api/v1/sales
  def index
    @sales = Sale.includes(:client, :user, sale_items: :stock_item).all

    # Render sales with the same structure as the create action
    render json: {
      status: "success",
      data: {
        sales: @sales.as_json(include: {
          client: {},
          user: {},
          sale_items: { include: :stock_item }
        })
      }
    }
  end

  # GET api/v1/sales/:id
  def show
    @sale = Sale.includes(:client, :user, sale_items: :stock_item).find(params[:id])

    render json: {status: "success", data: {sale: @sale.as_json(include: [:client, :user, sale_items: :stock_item])}}

  rescue ActiveRecord::RecordNotFound
    render json: {status: "fail", error: {message: "Sale not found"}}, status: :not_found
  end

  # POST api/v1/sales
  def create
    # Extract the sale items array from the request params
    sale_items = sale_params[:sale_items]

    # Verify if sale item quantity is less than stock item quantity else render error unprocessable entity
    sale_items.each do |sale_item|
      stock_item = StockItem.find(sale_item[:stock_item_id])
      if stock_item[:quantity] < sale_item[:quantity]
        render json: { status: "fail", error: {message: "Not enough items in stock", stock_item: stock_item}}, status: :unprocessable_entity
        return
      end
    end

    # Create the sale
    sale = Sale.new(user_id: sale_params[:user_id], client_id: sale_params[:client_id])

    if sale.save
      # Create the sale items of that sale and subtract the quantity of the stock items
      sale_items.each do |sale_item|
        # Create each sale item
        SaleItem.create(stock_item_id: sale_item[:stock_item_id], sale_id: sale[:id], quantity: sale_item[:quantity], unit_sale_price: sale_item[:unit_sale_price])

        # Subtract the quantity of the sale item
        stock_item = StockItem.find(sale_item[:stock_item_id])
        new_quantity = stock_item[:quantity] - sale_item[:quantity]

        # Update the stock item new quantity in the database
        stock_item.update({quantity: new_quantity})
      end

      # Select joined sale, client, user, and sale item for rendering
      @sale = Sale.includes(:client, :user, :sale_items).find(sale[:id])

      # Select stock items for rendering since their quantities have been updated
      @stock_items = StockItem.includes(:item).all

      # Render the sale and the stock items in a json response
      render json: {
        status: "success",
        data: {
          sale: @sale.as_json(include: [:client, :user, sale_items: { include: :stock_item }]),
          stock_items: @stock_items
        }
      }, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create sale"}}, status: :unprocessable_entity
    end
  end

  private

  # Permit new sale params
  def sale_params
    params.require(:sale).permit(:user_id, :client_id, sale_items: [:quantity, :stock_item_id, :unit_sale_price])
  end
end
