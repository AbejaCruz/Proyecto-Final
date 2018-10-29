class Users::SessionsController < Devise::SessionsController
  include Users::SessionsHelper
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by_email(params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password])
        sign_in(:user, user)
        redirect_to resolve_redirection_url
      else
        flash[:error] = 'Clave invalida'
        redirect_to new_user_session_url
      end
    else
      flash[:error] = 'No existe el usuario'
      redirect_to new_user_session_url
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
