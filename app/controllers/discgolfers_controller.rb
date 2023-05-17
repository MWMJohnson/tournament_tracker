class DiscgolfersController < ApplicationController
  def index
    @discgolfers = Discgolfer.members_only
  end

  def show
    @discgolfer = Discgolfer.find(params[:id])
  end

  def edit
    @discgolfer = Discgolfer.find(params[:id])
    
  end

  def update 
    discgolfer = Discgolfer.find(params[:id])
    discgolfer.update(discgolfer_params)
    discgolfer.save
    redirect_to "/discgolfers/#{discgolfer.id}"
  end

  private
  def discgolfer_params
    params.permit(:name, :rating, :pdga_member)
  end

end