# [X] done

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
require "rails_helper"

RSpec.describe 'Tournaments discgolfers index' do
  before :each do
    #Pro Tournament
    @tournament = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    
    #Amateur Tournament
    @tournament_2 = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    
    #Pros
    @dg_1 = @tournament.discgolfers.create!(name: "Eagle McMahon", rating: 1046, pdga_member: true)
    @dg_2 = @tournament.discgolfers.create!(name: "Paul McBeth", rating: 1055, pdga_member: true)
    @dg_3 = @tournament.discgolfers.create!(name: "Richard Wysocki", rating: 1049, pdga_member: true)
    @dg_4 = @tournament.discgolfers.create!(name: "James Conrad", rating: 1049, pdga_member: true)
    @dg_5 = @tournament.discgolfers.create!(name: "Chris Dickerson", rating: 1046, pdga_member: true)
    @dg_6 = @tournament.discgolfers.create!(name: "Nikko Locastro", rating: 1030, pdga_member: true)

    #Amateurs
    @dg_7 = @tournament_2.discgolfers.create!(name: "Channing Smith", rating: 450, pdga_member: false)
    @dg_8 = @tournament_2.discgolfers.create!(name: "Bob Dylan", rating: 500, pdga_member: false)
    @dg_9 = @tournament_2.discgolfers.create!(name: "Rachel Dirk", rating: 620, pdga_member: true)
    @dg_10 = @tournament_2.discgolfers.create!(name: "Joe Ye", rating: 640, pdga_member: true)
    @dg_11 = @tournament_2.discgolfers.create!(name: "Ralph Lauren", rating: 380, pdga_member: false)
    @dg_12 = @tournament_2.discgolfers.create!(name: "Willy Nelseon", rating: 250, pdga_member: true)
  end

  it "shows all of the names of discgolfers participating in the tournament" do 
    visit "/tournaments/#{@tournament.id}/discgolfers"

    expect(page).to have_content(@dg_1.name)
    expect(page).to have_content("Eagle McMahon")
    expect(page).to_not have_content(@dg_7.name)
  end
  
  
  it "shows each discgolfers' rating and pdga member status" do
    visit "/tournaments/#{@tournament_2.id}/discgolfers"

    expect(page).to have_content(@dg_7.rating)
    expect(page).to_not have_content(@dg_1.rating)

    expect(page).to have_content("Channing Smith")
    expect(page).to have_content("Rating: #{@dg_7.rating}")
    expect(page).to have_content("PDGA Member: #{@dg_7.pdga_member}")   
  end
  
  # PLEASE READ! Below, I created this test and functionality for this index at first accidentally for user story 6 instead of the tournaments#index, but since it works I decided to leave it in here.
  
  it "displays each discgolfer in the order they were created" do

    visit "/tournaments/#{@tournament_2.id}/discgolfers"
    
    actual = page.all('h2').map(&:text)

    expected = [
      "Channing Smith", 
      "Bob Dylan", 
      "Rachel Dirk", 
      "Joe Ye", 
      "Ralph Lauren", 
      "Willy Nelseon"
      ]

    expect(actual).to eq(expected)

    @dg_7.update(created_at:1.days.ago)
    @dg_8.update(created_at:2.days.ago)
    @dg_9.update(created_at:3.days.ago)
    @dg_10.update(created_at:4.days.ago)
    @dg_11.update(created_at:5.days.ago)
    @dg_12.update(created_at:6.days.ago)
    
    visit "/tournaments/#{@tournament_2.id}/discgolfers"

    actual = page.all('h2').map(&:text)

    expected = [
      "Willy Nelseon", 
      "Ralph Lauren", 
      "Joe Ye", 
      "Rachel Dirk", 
      "Bob Dylan", 
      "Channing Smith"
      ]

    expect(actual).to eq(expected)
  end

end