# [X] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

require 'rails_helper'

RSpec.describe 'the tournaments show page' do
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

  it 'displays the tournament name' do
    visit "/tournaments/#{@tournament_1.id}"

    expect(page).to have_content(@tournament_1.name)
    expect(page).to_not have_content(@tournament_2.name)
  end

  it 'displays the other attributes of the tournament' do
    visit "/tournaments/#{@tournament_1.id}"

    expect(page).to have_content("Regional Pro Open 1")
    expect(page).to have_content("Course: #{@tournament_1.course}")
    expect(page).to have_content("Date: #{@tournament_1.date}")
    expect(page).to have_content("Entry fee: $ #{@tournament_1.entry_fee}")
    expect(page).to have_content("Professionals only: #{@tournament_1.pdga_members_only}")
  end

# [X] done

# User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
  it 'displays the number of discgolfers signed up for the tournamet' do
    visit "/tournaments/#{@tournament_1.id}"

    expect(page).to have_content("Current no. of discgolfers: #{@tournament_1.count}")
    expect(page).to have_content("Current no. of discgolfers: 3")

    visit "/tournaments/#{@tournament_3.id}"

    expect(page).to have_content("Current no. of discgolfers: #{@tournament_3.count}")
    expect(page).to have_content("Current no. of discgolfers: 1")
    
    visit "/tournaments/#{@tournament_6.id}"
    
    expect(page).to have_content("Current no. of discgolfers: #{@tournament_6.count}")
    expect(page).to have_content("Current no. of discgolfers: 0")
  end
end