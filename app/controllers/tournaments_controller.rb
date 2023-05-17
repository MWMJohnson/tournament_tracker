class TournamentsController < ApplicationController
  def index
    #COME BACK TO LINE 4 and move (order.created_at logic to the model) !!!!!!
    @tournaments = Tournament.tournament_sort
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
  end

  def create 
    tournament = Tournament.new(tournament_params)
    tournament.save
    redirect_to '/tournaments'
  end

  def edit
    
  end

  private 
  def tournament_params
    params.permit(:name, :course, :entry_fee, :pdga_members_only)
  end

end