class UsersController < Clearance::UsersController
  skip_before_action :require_login, only: [:create, :new, :show], raise: false

  def show
    @user = User.find(params[:id])
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end
end
