class PasswordsController < Clearance::PasswordsController
  def find_user_by_id_and_confirmation_token
    user_param = Clearance.configuration.user_id_parameter
    token = params[:token] || session[:password_reset_token]

    Clearance.configuration.user_model
      .find_by(slug: params[user_param], confirmation_token: token.to_s)
  end
end
