class Api::V1::EstablishementsController < ApplicationController
  before_action :find_establishement, only: [:update]
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

  def update
    if @establishement.update(establishement_params)
      render json: {status: "success", data: {establishement: @establishement }}, status: :success
    else
      render json: {status: "fail", error: {message: "Couldn;'t update establishement"}}, status: :unprocessable_entity
    end
  end

  private

  def establishement_params
    params.require(:establishement).permit(:name)
  end

  def find_establishement
    @establishement = Establishment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status: "fail", message: {message: "Couldn't find record"}}, status: :not_found
  end
end
