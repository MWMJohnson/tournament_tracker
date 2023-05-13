class AddTournamentToDiscgolfers < ActiveRecord::Migration[7.0]
  def change
    add_reference :discgolfers, :tournament, foreign_key: true
  end
end
