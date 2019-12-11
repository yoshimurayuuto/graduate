class FamiliesController < ApplicationController
  before_action :set_family, only: [:show]

  def index
    @families = Family.all
    if params[:family].present?
      @families = @families.search_with_title(params[:family][:title])
      @keyword = params[:family][:title]
    end
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to families_path
    else
      render new
    end
  end

  def show
  end

  private
  def family_params
    params.require(:family).permit(:title, :body)
  end

  def set_family
    @family = Family.find(params[:id])
  end
end
