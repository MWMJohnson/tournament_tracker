# [X] done

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require "rails_helper"

RSpec.describe "tournaments index page", type: :feature do
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
    @dg_4 = @tournament_1.discgolfers.create!(name: "James Conrad", rating: 1049, pdga_member: true)
    @dg_5 = @tournament_1.discgolfers.create!(name: "Chris Dickerson", rating: 1046, pdga_member: true)
    @dg_6 = @tournament_1.discgolfers.create!(name: "Nikko Locastro", rating: 1030, pdga_member: true)

    #Amateurs
    @dg_7 = @tournament_4.discgolfers.create!(name: "Channing Smith", rating: 450, pdga_member: false)
    @dg_8 = @tournament_4.discgolfers.create!(name: "Bob Dylan", rating: 500, pdga_member: false)
    @dg_9 = @tournament_4.discgolfers.create!(name: "Rachel Dirk", rating: 620, pdga_member: true)
    @dg_10 = @tournament_4.discgolfers.create!(name: "Joe Ye", rating: 640, pdga_member: true)
    @dg_11 = @tournament_4.discgolfers.create!(name: "Ralph Lauren", rating: 380, pdga_member: false)
    @dg_12 = @tournament_4.discgolfers.create!(name: "Willy Nelseon", rating: 250, pdga_member: true)
  end

  it " can see all tournament names" do 
    visit "/tournaments"

    expect(page).to have_content(@tournament_1.name)
    expect(page).to have_content("Regional Pro Open 1")

    expect(page).to have_content(@tournament_4.name)
    expect(page).to have_content("Regional AM Open 1")
  end

  # [X] done

  # User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  it "displays each discgolfer in the order they were created with the created_at attribute listed" do

    visit "/tournaments"
    actual = page.all('h3').map(&:text)

    expected = [
      "#{@tournament_6.name} created on: #{@tournament_6.created_at}",
      "#{@tournament_5.name} created on: #{@tournament_5.created_at}",
      "#{@tournament_4.name} created on: #{@tournament_4.created_at}", 
      "#{@tournament_3.name} created on: #{@tournament_3.created_at}", 
      "#{@tournament_2.name} created on: #{@tournament_2.created_at}",
      "#{@tournament_1.name} created on: #{@tournament_1.created_at}"
        ]

    expect(actual).to eq(expected)

    @tournament_1.update(created_at:70.days.ago)
    @tournament_2.update(created_at:50.days.ago)
    @tournament_3.update(created_at:80.days.ago)
    @tournament_4.update(created_at:100.days.ago)
    @tournament_5.update(created_at:90.days.ago)
    @tournament_6.update(created_at:60.days.ago)
    
    visit "/tournaments"
    actual = page.all('h3').map(&:text)

    expected = [
      "#{@tournament_2.name} created on: #{@tournament_2.created_at}",
      "#{@tournament_6.name} created on: #{@tournament_6.created_at}", 
      "#{@tournament_1.name} created on: #{@tournament_1.created_at}", 
      "#{@tournament_3.name} created on: #{@tournament_3.created_at}", 
      "#{@tournament_5.name} created on: #{@tournament_5.created_at}",
      "#{@tournament_4.name} created on: #{@tournament_4.created_at}"
    ]

    expect(actual).to eq(expected)
  end

  it "has a link to /tournaments/new" do 
    visit "/tournaments"
    
    click_link("New Tournament")
    expect(current_path).to eq("/tournaments/new")   
  end

end