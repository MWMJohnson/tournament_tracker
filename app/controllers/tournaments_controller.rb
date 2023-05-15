class TournamentsController < ApplicationController
  def index
    #COME BACK TO LINE 4 and move (order.created_at logic to the model) !!!!!!
    @tournaments = Tournament.tournament_sort
  end

  def show
    @tournament = Tournament.find(params[:id])
  end


end