class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  def create
    user = User.new(user_params)
    if user.save
      render json: {
        message: "Singed Up Successfully",
        is_success: true,
        date: {
          user: user
        }
      }, status: :ok
    else
      render json: {
        message: "Something Wrong",
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].exist?
    render json: {
      message: "Missing params",
      is_success: false,
      data: {}
    }, status: :bad_request
  end
end