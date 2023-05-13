class TournamentDiscgolfersController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @discgolfers = @tournament.discgolfers
  end




end