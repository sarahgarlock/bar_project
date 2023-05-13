class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    require 'pry'; binding.pry

    # @bar = Bar.find(params[:id])
  end
end
