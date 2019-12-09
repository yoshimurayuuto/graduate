class UsersController < ApplicationController
  before_action :current_user, only: [:index]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
end
