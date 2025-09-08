class Api::V1::PurchasesController < ApplicationController
  def index
    @purchases = Sale.includes(:client, :user, sale_items: :stock_item).where({client_id: params[:client_id]})

    render json: {
      status: "success",
      data: {
        purchases: @purchases.as_json(include: {
          client: {},
          user: {},
          sale_items: { include: {stock_item: {include: :item} } }
        })
      }
    }
  end

  private

  def purchase_params

  end
end
