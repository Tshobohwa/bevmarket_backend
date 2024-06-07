class Api::V1::ExpensesController < ApplicationController
  before_action :find_expense, only: [:show, :destroy, :update]

  # GET api/v1/expenses
  def index
    @expenses = Expense.all
    render json: {status: 'success', data: {expenses: @expenses } }
  end

  # GET api/v1/expenses/:id
  def show
    render json: {status: "success", data: {expense: @expense}}
  end

  # POST api/v1/expenses
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render json: {status: "success", data: {expense: @expense}}
    else
      render json: {status: "fail", error: {message: "Couldn't create expense"}}, status: :unprocessable_entity
    end
  end

  # UPDATE api/v1/expenses/:id
  def update
    if @expense.update(expense_params)
      render json: {status: "success", data: {expense: @expense} }
    else
      render json: {status: "fail", error: {message: "Couldn't update expense"}}, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/expenses/:id
  def destroy
    @expense.destroy
  end

  private

  # Find expense by id
  def find_expense
    @expense = Expense.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status: "fail", error: {message: "Expense with id #{params[:id]} not found"}}, status: :not_found
  end

  # Permit expense request params
  def expense_params
    params.require(:expense).permit(:user_id, :amount, :reason)
  end
end
