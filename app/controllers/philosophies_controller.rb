class PhilosophiesController < ApplicationController
  before_action :set_philosophy, only: [:show, :destroy]
  def index
    @philosophies = Philosophy.all
    if params[:philosophy].present?
      @philosophies = @philosophies.search_with_title(params[:philosophy][:title])
      @keyword = params[:philosophy][:title]
    end
  end

  def new
    @philosophy = Philosophy.new
  end

  def create
    @philosophy = Philosophy.new(philosophy_params)
    if @philosophy.save
      redirect_to philosophies_path
    else
      render new
    end
  end

  def show
  end

  def destroy
    @philosophy.destroy
    redirect_to philosophies_path
  end

  private
  def philosophy_params
    params.require(:philosophy).permit(:title, :body)
  end

  def set_philosophy
    @philosophy = Philosophy.find(params[:id])
  end
end
