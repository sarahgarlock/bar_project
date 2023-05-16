class KegsController < ApplicationController
  def index
    @kegs = Keg.all
  end

  def show
    @keg = Keg.find(params[:id])
  end

  def edit
    @keg = Keg.find(params[:id])
  end

  def update
    keg = Keg.find(params[:id])
    keg.update(keg_params)
    keg.save
    redirect_to "/kegs/#{keg.id}"
  end

  private
  def keg_params
    params.permit(:name, :beer_type, :ordered, :abv, :ibu, :price, :bar_id)
  end
end