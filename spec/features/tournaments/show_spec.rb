require 'rails_helper'

RSpec.describe 'the tournaments show page' do
  before :each do
  @tournament = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
  @tournament_2 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
  end

  # [X] done

  # User Story 2, Parent Show 

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  it 'displays the tournament name' do
    visit "/tournaments/#{@tournament.id}"

    expect(page).to have_content(@tournament.name)
    expect(page).to_not have_content(@tournament_2.name)
  end

  it 'displays the attributes of a tournament' do
    visit "/tournaments/#{@tournament.id}"

    expect(page).to have_content("Regional AM Open 1")
    expect(page).to have_content("Course: #{@tournament.course}")
    expect(page).to have_content("Date: #{@tournament.date}")
    expect(page).to have_content("Entry fee: $ #{@tournament.entry_fee}")
    expect(page).to have_content("Professionals only: #{@tournament.pdga_members_only}")    
  end


end