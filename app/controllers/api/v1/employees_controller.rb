class Api::V1::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: {status:"success", data: {employee: @employee}}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create employee"}}, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:user_id, :establishment_id, :role, :sale_point_id)
  end
end
