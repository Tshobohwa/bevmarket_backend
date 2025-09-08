class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def get_current_employee
    @current_employee = Employee.find_by({user_id: :current_user[:id]})
  rescue ActiveRecord::RecordNotFound
    render json: { error: {message: "Employee not found"}}, status: :unauthorized_access
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
            