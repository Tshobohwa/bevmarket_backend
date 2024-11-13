class Api::V1::EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: {status:"success", data: {employee: @employee.as_json(include: [:establishment, :user])}}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create employee"}}, status: :unprocessable_entity
    end
  end

  def show
    render json: { data: { employee: @employee.as_json(include: [:establishment, :user]) } }
  end

  def update

  end

  def destroy

  end

  private

  def employee_params
    params.require(:employee).permit(:user_id, :establishment_id, :role, :sale_point_id)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status:'fail', error: {message: 'Employee not found'}}, status: :not_found
  end
end
