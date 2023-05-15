require 'rails_helper'

RSpec.describe "Application Layout" do
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


  describe "Navigation Bar" do
    # [X] done

    # User Story 8, Child Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    it "has a link to the discgolfers index page at the top of each page" do
      visit '/discgolfers'
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end

      visit "/discgolfers/#{@dg_1.id}"
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end

      visit '/tournaments'
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end
    end

    # [X] done

    # User Story 9, Parent Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    it "has a link to the tournaments index page at the top of each page " do 
      visit '/tournaments'
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end

      visit "/tournaments/#{@tournament_1.id}/discgolfers"
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end

      visit '/discgolfers'
      within 'nav' do
        expect(page).to have_link("Discgolfers")
      end
    end
  end
end