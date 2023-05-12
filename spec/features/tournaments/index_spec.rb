require "rails_helper"

RSpec.describe "tournaments index page", type: :feature do
  before :each do
    @tournament = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    @tournament_2 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    end

  it " can see all tournament names" do 
    visit "/tournaments"

    expect(page).to have_content(@tournament.name)
    expect(page).to have_content("Regional AM Open 1")
    expect(page).to have_content("Course: #{@tournament.course}")
    expect(page).to have_content("Date: #{@tournament.date}")
    expect(page).to have_content("Entry fee: $ #{@tournament.entry_fee}")
    expect(page).to have_content("Professionals only: #{@tournament.pdga_members_only}")
    #should I be testing differently or more?
    expect(page).to have_content(@tournament_2.name)
    expect(page).to have_content("Regional Pro Open 1")
  end




end