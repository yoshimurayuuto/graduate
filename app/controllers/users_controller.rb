class UsersController < ApplicationController
  before_action :current_user, only: [:index]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :tag_list)
  end
end
