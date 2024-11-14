class Api::V1::UnemployedUsersController < ApplicationController
  def index
    @unemployed_users = User.where({is_employed: false})
  end
end
