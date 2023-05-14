class Tournament < ApplicationRecord
  has_many :discgolfers

  def count
    self.discgolfers.count
  end
end