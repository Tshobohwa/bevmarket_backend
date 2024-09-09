class Api::V1::EstablishementsController < ApplicationController
  def index
    @establishements = Establishment.all

    render json: {status: "success", data: {establishements: @establishements}}
  end

  def create
    @establishement = Establishment.new(establishement_params)

    if @establishement.save
      render json: {status: "success", data: {establishement: @establishement }}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create establishement"}}, status: :unprocessable_entity
    end
  end

  private

  def establishement_params
    params.require(:establishement).permit(:name)
  end
end
