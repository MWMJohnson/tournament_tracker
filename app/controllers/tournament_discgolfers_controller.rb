class TournamentDiscgolfersController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @discgolfers = @tournament.discgolfers
  end

  def new
    @tournament = Tournament.find(params[:id])
  end

  def create
    tournament = Tournament.find(params[:id])
    @discgolfer = tournament.discgolfers.create(tournament_discgolfer_params)
    redirect_to "/tournaments/#{tournament.id}/discgolfers"
  end

  private 
  def tournament_discgolfer_params
    params.permit(:name, :rating, :pdga_member)
  end

end