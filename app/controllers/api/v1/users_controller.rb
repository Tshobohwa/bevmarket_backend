class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy, :show]

  # GET api/v1/users
  def index
    @users = User.all
    render json: {status: 'success', data: {users: @users}}
  end

  # GET api/v1/users/:id
  def show
      render json: {status: "success", data: {user: @user}}
  end

  # POST api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'success', data: {user: @user } }, status: :created
    else
      render json: {status: 'fail', error: {message: "Couldn't create user" } }, status: :unprocessable_entity
    end
  end

  # UPDATE api/v1/users/:id
  def update
    if @user.update(user_params)
      render json: {status: "success", data: { user: @user } }
    else
      render json: {status: "fail", error: {message: "Couldn't update user"}}, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/:id
  def destroy
    @user.destroy
  end

  private

  # find user by id param
  def find_user
      @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {status:'fail', error: {message: 'User not found'}}, status: :not_found
  end

  # Serialize user params
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
