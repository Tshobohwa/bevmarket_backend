class Api::V1::EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :update, :destroy]
  def index

    @current_employee = Employee.find_by(establishment_id: params[:establishment_id], user_id: params[:user_id ])

    render json: { status: "success", data: { current_employee: @current_employee }} if params[:establishment].present? && params[:user_id].present?


    @employees = Employee.includes(:user).where(establishment_id: current_user.establishment_id)

    render json: { status: "success", data: { current_employee: @current_employee.as_json(includes: :user) }}
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
