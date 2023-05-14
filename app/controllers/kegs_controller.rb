class KegsController < ApplicationController
  def index
    @kegs = Keg.all
  end

  def show
    @keg = Keg.find(params[:id])
  end
end