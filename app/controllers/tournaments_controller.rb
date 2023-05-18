class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.tournament_sort
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create 
    tournament = Tournament.new(tournament_params)
    tournament.save
    redirect_to '/tournaments'
  end

  
  def update
    tournament = Tournament.find(params[:id])
    tournament.update(tournament_params)
    tournament.save
    redirect_to "/tournaments/#{tournament.id}"
  end

  private 
  def tournament_params
    params.permit(:name, :course, :entry_fee, :pdga_members_only)
  end

end