class PhilosophiesController < ApplicationController
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

  private
  def philosophy_params
    params.require(:philosophy).permit(:title, :body)
  end

  def set_philosophy
  end
end
