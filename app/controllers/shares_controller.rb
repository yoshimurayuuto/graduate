class SharesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy, :index, :show]
  before_action :set_share, only: [ :edit, :update, :destroy, :show]
  before_action :management,   only: [:edit, :update]
  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    @share.user_id = current_user.id
    if @share.save
      redirect_to shares_path
    else
      render :new, notice: "投稿できませんでした"
    end
  end

  def show
    @comments = @share.comments
    @comment = @share.comments.build
  end
  
    def edit
    end

   def update
    if @share.update(share_params)
      redirect_to shares_path
    else
      render :edit
    end
  end

   def destroy
    @share.destroy
    redirect_to shares_path, notice: "削除しました"
  end

   private

   def share_params
    params.require(:share).permit(:declaration)
   end

   def set_share
    @share = Share.find(params[:id])
   end

   def management
    unless @share.user_id == current_user.id
      redirect_to shares_path
    end
   end

end
