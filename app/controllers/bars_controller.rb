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

  def edit
    @bar = Bar.find(params[:id])
  end

  def update

    bar = Bar.find(params[:id])
    bar.update(bar_params)
    bar.save
    redirect_to "/bars/#{bar.id}"
  end

  private
    def bar_params
      params.permit(:name, :city, :tap_quantity, :overnight_delivery)
    end

end
