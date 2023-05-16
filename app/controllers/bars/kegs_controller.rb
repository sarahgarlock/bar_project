# module Bars
#   class KegsController < ApplicationController

#   end
# end
class Bars::KegsController < ApplicationController
  def index
    @bar = Bar.find(params[:id])
    @kegs = @bar.kegs
  end

  def new
    @bar = Bar.find(params[:id])
  end

  def create
    @bar = Bar.find(params[:id])
    @bar.kegs.create(keg_params)
    redirect_to "/bars/#{params[:id]}/kegs"
  end

  private
  def keg_params
    params.permit(:name, :beer_type, :ordered, :abv, :ibu, :price, :bar_id)
  end
end