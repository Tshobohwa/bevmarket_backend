class Api::V1::EstablishmentsController < ApplicationController
  before_action :find_establishment, only: [:update]
  def index
    @establishments = Establishment.all

    render json: {status: "success", data: {establishments: @establishments}}
  end

  def create
    @establishment = Establishment.new(establishment_params)

    if @establishment.save
      render json: {status: "success", data: {establishment: @establishment }}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create establishment"}}, status: :unprocessable_entity
    end
  end

  def update
    if @establishment.update(establishment_params)
      render json: {status: "success", data: {establishment: @establishment }}, status: :success
    else
      render json: {status: "fail", error: {message: "Couldn;'t update establishment"}}, status: :unprocessable_entity
    end
  end

  private

  def establishment_params
    params.require(:establishment).permit(:name)
  end

  def find_establishment
    @establishment = Establishment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status: "fail", message: {message: "Couldn't find record"}}, status: :not_found
  end
end
