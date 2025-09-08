class Api::V1::StockMovementsController < ApplicationController
  def index
    @stock_movements = StockMovement.includes(:stock_item)
    if valid_date?(params[:from]) && valid_date?(params[:to])
      from_date = Date.parse(params[:from])
      to_date = Date.parse(params[:to])
      @stock_movements = @stock_movements.where(created_at: from_date.beginning_of_day..to_date.end_of_day, establishment_id: current_user.current_establishment_id)
    elsif valid_date?(params[:date])
      current_date = Date.parse(params[:date])
      @stock_movements = @stock_movements.where(created_at: current_date.beginning_of_day..current_date.end_of_day, establishment_id: current_user.current_establishment_id)
    end
    render json: {status: "success", data: {stock_movements: @stock_movements.as_json(include: {
      stock_item: {include: :item}
    })}}
  end

  private

  def valid_date?(date_string)
    Date.iso8601(date_string) rescue false
  end
end
