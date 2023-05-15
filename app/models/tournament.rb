class Tournament < ApplicationRecord
  has_many :discgolfers

  def self.tournament_sort
    Tournament.all.order(created_at: :desc)
  end

  def golfer_count
    discgolfers.count
  end

end