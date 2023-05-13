# [X] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

require "rails_helper"

RSpec.describe "discgolfers index page", type: :feature do
  before :each do
    @tournament = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    @tournament_2 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    @dg_1 = @tournament_2.discgolfers.create!(name: "Eagle McMahon", rating: 1046, pdga_member: true)
    @dg_2 = @tournament.discgolfers.create!(name: "Channing Smith", rating: 450, pdga_member: false)
  end

  it " can show all discgolfers with their attributes" do 
    visit "/discgolfers"
    
    expect(page).to have_content(@dg_1.name)
    expect(page).to have_content("Eagle McMahon")
    expect(page).to have_content("Rating: #{@dg_1.rating}")
    expect(page).to have_content("PDGA Member: #{@dg_1.pdga_member}")    


    expect(page).to have_content(@dg_2.name)
    expect(page).to have_content("Channing Smith")
    expect(page).to have_content("Rating: #{@dg_2.rating}")
    expect(page).to have_content("PDGA Member: #{@dg_2.pdga_member}")  
  end
end