
require "rails_helper"

RSpec.describe "tournaments index page", type: :feature do
  before :each do
    @tournament = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    @tournament_2 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    end

  # [X] done

  # User Story 1, Parent Index 

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it " can see all tournament names" do 
    visit "/tournaments"

    expect(page).to have_content(@tournament.name)
    expect(page).to have_content("Regional AM Open 1")

    expect(page).to have_content(@tournament_2.name)
    expect(page).to have_content("Regional Pro Open 1")
  end
end