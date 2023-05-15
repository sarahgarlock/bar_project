class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end
  
  def show
    @bar = Bar.find(params[:id])
  end

  def new

  end

  def create
    Bar.create(bar_params)
    redirect_to "/bars"
  end

  private
    def bar_params
      params.permit(:name)
    end
end
