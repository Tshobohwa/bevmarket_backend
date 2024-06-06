class Api::V1::UsersController < ApplicationController
  # GET api/v1/users
  def index
    @users = User.all
    render json: {status: 'success', data: {users: @users}}
  end

  #POST api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'success', data: {user: @user } }
    else
      render json: {status: 'fail', error: {message: "Couldn't create user" } }, status: :unprocessable_entity
    end
  end

  # UPDATE api/v1/users/:id
  def update

  end

  private
  # Serialize user params
  def user_params
    request.params(:user).permit(:name, :email)
  end

  # find user by id param
  def find_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {status:'fail', error: {message: 'Item not found'}}, status: :unprocessable_entity
  end
end
