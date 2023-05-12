class DiscgolfersController < ApplicationController
  def index
    @discgolfers = Discgolfer.all
  end

end