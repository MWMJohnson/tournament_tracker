class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all.order(:created_at)
  end

  def show
    @tournament = Tournament.find(params[:id])
  end


end