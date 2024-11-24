class Api::V1::EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :update, :destroy]
  def index
    if !params[:establishment_id].nil? && !params[:user_id].nil?
      @current_employee = Employee.find_by(establishment_id: params[:establishment_id], user_id: params[:user_id])

      render json: { status: "success", data: { current_employee: @current_employee } }
    else
      @employees = Employee.includes(:user, :establishment, :sale_point).where(establishment_id: current_user.establishment_id)

      render json: { status: "success", data: { employees: @employees.as_json(include: [:user, :establishment, :sale_point]) }}
    end
  end

  def create
    @user = User.find(employee_params[:user_id])

    @employee = Employee.new(employee_params)

    if @employee.save
      @user.update!({is_employed: true, current_establishment_id: employee_params[:establishment_id]})
      render json: {status:"success", data: {employee: @employee.as_json(include: [:establishment, :user])}}, status: :created
    else
      render json: {status: "fail", error: {message: "Couldn't create employee"}}, status: :unprocessable_entity
    end
  end

  def show
    render json: { data: { employee: @employee.as_json(include: [:establishment, :user]) } }
  end

  def update
    @user = User.find(employee_params[:user_id])

    if @employee.update(employee_params)
      @user.update(user_params)

      render json: {status: "success", data: @employee.as_json(include: [:user, :sale_point, :establishment])}
    else
      render json: {status: "fail", error: {message: "couldn't update employee"}}, status: :unprocessable_entity
    end
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

  def employee_params
    params.require(:employee).permit(:establishment_id, :sale_point_id, :role, :user_id)
  end

  def user_params
    params.require(:user).permit(:establishment_id, :is_employed)
  end
end
