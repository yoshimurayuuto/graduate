class MoneisController < ApplicationController
  before_action :set_money, only: [:destroy, :show]
  def index
    @moneis = Money.all
    if params[:money].present?
      @moneis = @moneis.search_with_title(params[:money][:title])
      @keyword = params[:money][:title]
    end
  end

  def new
    @money = Money.new
  end

  def create
    @money = Money.new(money_params)
    if @money.save
      redirect_to moneis_path 
    else
      render new
    end
  end

  def show
  end

  def destroy
    @money.destroy
    redirect_to moneis_path
  end

  private

  def money_params
    params.require(:money).permit(:title, :body)
  end

  def set_money
    @money = Money.find(params[:id])
  end

end
