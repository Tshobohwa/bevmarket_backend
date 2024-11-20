class Api::V1::EstablishmentsController < ApplicationController
  before_action :find_establishment, only: [:update]
  def index
    @establishments = Establishment.all

    render json: {status: "success", data: {establishments: @establishments}}
  end

  def create
    ActiveRecord::Base.transaction do
      @establishment = Establishment.new(establishment_params)

      if @establishment.save
        # Create SalePoint associated with the establishment
        @sale_point = SalePoint.create!({ establishment_id: @establishment[:id], sale_point_type: "warehouse" })

        # Create Warehouse associated with the SalePoint
        @warehouse = Warehouse.create!(warehouse_params.merge(sale_point_id: @sale_point[:id]))

        # Find the user who created the establishment and mark them as employed
        @user = User.find(establishment_params[:created_by])
        @user.update!({is_employed: true, current_establishment_id: @establishment[:id]})

        # Create an Employee record for the user with an admin role
        @employee = Employee.create!({ role: "admin", establishment_id: @establishment[:id], user_id: @user[:id], sale_point_id: @sale_point[:id] })

        render json: { status: "success", data: { establishment: @establishment, sale_point: @sale_point, warehouse: @warehouse, user: @user, employee: @employee } }, status: :created
      else
        # If establishment fails to save, raise an exception to roll back the transaction
        raise ActiveRecord::Rollback
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
      render json: { status: "fail", error: { message: e.message } }, status: :unprocessable_entity
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
    params.require(:establishment).permit(:name, :created_by)
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :location)
  end

  def find_establishment
    @establishment = Establishment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status: "fail", message: {message: "Couldn't find record"}}, status: :not_found
  end
end
