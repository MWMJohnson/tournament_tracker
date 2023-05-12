class DiscgolfersController < ApplicationController
  def index
    @discgolfers = Discgolfer.all
  end

  def show
    @discgolfer = Discgolfer.find(params[:id])
  end

end