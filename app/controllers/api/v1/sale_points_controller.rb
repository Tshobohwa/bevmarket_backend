class Api::V1::SalePointsController < ApplicationController
  def index
    @sale_points = SalePoint.all

    render json: {status: "success", data: {sale_points: @sale_points}}
  end

  def create
    @sale_point = SalePoint.new(sale_point_params)

    if @sale_point.save
      render json: {status: "success", data: {sale_point: @sale_point}}, status: :created
    else
      render json: {status: "fail", error: {message: "couldn't create sale point"}}
    end
  end

  private

  def sale_point_params
    params.require(:sale_point).permit(:name, :establishement_id)
  end
end
