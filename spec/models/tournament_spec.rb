require "rails_helper"

RSpec.describe Tournament do
  it {should have_many :discgolfers}

  before :each do
    #Pro Tournaments
    @tournament_1 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    @tournament_2 = Tournament.create!(name: "Regional Pro Open 2", course: "Beaver Ranch", date: Date.new(2023,9,2), entry_fee: 200, pdga_members_only: true)
    @tournament_3 = Tournament.create!(name: "Regional Pro Open 3", course: "Adams Hollow", date: Date.new(2023,12,2), entry_fee: 200, pdga_members_only: true)
    
    #Amateur Tournaments
    @tournament_4 = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    @tournament_5 = Tournament.create!(name: "Regional AM Open 2", course: "west Creek", date: Date.new(2023,9,1), entry_fee: 100, pdga_members_only: false)
    @tournament_6 = Tournament.create!(name: "Regional AM Open 3", course: "Bird's Nest", date: Date.new(2023,12,1), entry_fee: 100, pdga_members_only: false)
    
    #Pros
    @dg_1 = @tournament_1.discgolfers.create!(name: "Eagle McMahon", rating: 1046, pdga_member: true)
    @dg_2 = @tournament_1.discgolfers.create!(name: "Paul McBeth", rating: 1055, pdga_member: true)
    @dg_3 = @tournament_1.discgolfers.create!(name: "Richard Wysocki", rating: 1049, pdga_member: true)
    @dg_4 = @tournament_2.discgolfers.create!(name: "James Conrad", rating: 1049, pdga_member: true)
    @dg_5 = @tournament_2.discgolfers.create!(name: "Chris Dickerson", rating: 1046, pdga_member: true)
    @dg_6 = @tournament_3.discgolfers.create!(name: "Nikko Locastro", rating: 1030, pdga_member: true)

    #Amateurs
    @dg_7 = @tournament_4.discgolfers.create!(name: "Channing Smith", rating: 450, pdga_member: false)
    @dg_8 = @tournament_4.discgolfers.create!(name: "Bob Dylan", rating: 500, pdga_member: false)
    @dg_9 = @tournament_4.discgolfers.create!(name: "Rachel Dirk", rating: 620, pdga_member: true)
    @dg_10 = @tournament_4.discgolfers.create!(name: "Joe Ye", rating: 640, pdga_member: true)
    @dg_11 = @tournament_5.discgolfers.create!(name: "Ralph Lauren", rating: 380, pdga_member: false)
    @dg_12 = @tournament_5.discgolfers.create!(name: "Willy Nelseon", rating: 250, pdga_member: true)
  end

#   [X] done

# User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  describe 'class methods'
    describe '#tournament_sort' do
      it 'sorts the tournaments by the most recently created' do
        expect(Tournament.tournament_sort).to eq([@tournament_6, @tournament_5, @tournament_4, @tournament_3, @tournament_2, @tournament_1])
        @tournament_1.update(created_at:70.days.ago)
        @tournament_2.update(created_at:50.days.ago)
        @tournament_3.update(created_at:80.days.ago)
        @tournament_4.update(created_at:100.days.ago)
        @tournament_5.update(created_at:90.days.ago)
        @tournament_6.update(created_at:60.days.ago)
        expect(Tournament.tournament_sort).to eq([@tournament_2, @tournament_6, @tournament_1, @tournament_3, @tournament_5, @tournament_4])
      end
    end

  # [X] done

  # User Story 7, Parent Child Count

  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  describe 'instance methods' do 
    describe '#count_discgolfers' do
      it 'returns the number of discgolfers in the tournament' do
        expect(@tournament_1.golfer_count).to eq(3)
        expect(@tournament_2.golfer_count).to eq(2)
        expect(@tournament_3.golfer_count).to eq(1)
        expect(@tournament_4.golfer_count).to eq(4)
        expect(@tournament_5.golfer_count).to eq(2)
        expect(@tournament_6.golfer_count).to eq(0)
      end
    end
  end
end