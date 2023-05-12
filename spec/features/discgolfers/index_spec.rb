
require "rails_helper"

RSpec.describe "discgolfers index page", type: :feature do
  before :each do
    @dg_1 = Discgolfer.create!(name: "Eagle McMahon", rating: 1046, pdga_member: true)
    @dg_2 = Discgolfer.create!(name: "Channing Smith", rating: 450, pdga_member: false)
  end

    # [X] done

    # User Story 3, Child Index 
    
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table)
  it " can see all discgolfer's records and attributes" do 
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