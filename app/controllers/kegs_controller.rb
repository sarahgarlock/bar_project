class KegsController < ApplicationController
  def index
    @kegs = Keg.all
  end
end