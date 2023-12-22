class AuthorsController < ApplicationController
  skip_before_action :require_login, only: :show, raise: false

  def show
    @author = User.find(params[:id])
  end
end
