# module Bars
#   class KegsController < ApplicationController

#   end
# end
class Bars::KegsController < ApplicationController
  def index
    @bar = Bar.find(params[:id])
    @kegs = @bar.kegs
  end
end