class TournamentDiscgolfersController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @discgolfers = @tournament.discgolfers.order(:created_at)
  end




end