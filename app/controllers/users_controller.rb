class UsersController < Clearance::UsersController
  skip_before_action :require_login, only: [:create, :new, :show], raise: false

  def show
    @user = User.find(params[:id])
  end
end
