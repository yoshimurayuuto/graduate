class SharesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy]
  before_action :set_share, only: [ :edit, :update, :destroy, :show]
  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    if @share.save
      ShareMailer.share_mail(@share).deliver
      redirect_to shares_path
    else
      render :new
    end
  end

  def show
    @comments = @share.comments
    @comment = @share.comments.build
  end

  def edit;end

   def update
    if @share.update(share_params)
      redirect_to shares_path
    else
      render :edit
    end
  end

   def destroy;end

   private

   def share_params
    params.require(:share).permit(:declaration)
   end

   def set_share
    @share = Share.find(params[:id])
   end
end
