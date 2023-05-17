class Discgolfer < ApplicationRecord
  belongs_to :tournament

  def self.members_only
    Discgolfer.all.where(pdga_member: :true)
  end
end