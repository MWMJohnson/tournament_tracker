#   [X] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'the discgolfers show page' do
  before :each do
    @tournament = Tournament.create!(name: "Regional AM Open 1", course: "Village Greens", date: Date.new(2023,6,1), entry_fee: 100, pdga_members_only: false)
    @tournament_2 = Tournament.create!(name: "Regional Pro Open 1", course: "Fehringer Ranch", date: Date.new(2023,6,2), entry_fee: 200, pdga_members_only: true)
    @dg_1 = @tournament.discgolfers.create!(name: "Eagle McMahon", rating: 1046, pdga_member: true)
    @dg_2 = @tournament_2.discgolfers.create!(name: "Channing Smith", rating: 450, pdga_member: false)
  end

  it 'displays the discgolfer name' do
    visit "/discgolfers/#{@dg_1.id}"

    expect(page).to have_content(@dg_1.name)
    expect(page).to_not have_content(@dg_2.name)
  end

  it 'displays the attributes of a discgolfer' do
    visit "/discgolfers/#{@dg_2.id}"

    expect(page).to have_content(@dg_2.rating)
    expect(page).to_not have_content(@dg_1.rating)

    expect(page).to have_content(@dg_2.pdga_member)
    expect(page).to_not have_content(@dg_1.pdga_member)
  end

  #   [ ] done

  # User Story 14, Child Update 

  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it "links to the discgolfer update page" do
    visit "/discgolfers/#{@dg_1.id}"

    click_link "Update Discgolfer"
    expect(current_path).to eq("/discgolfers/#{@dg_1.id}/edit")
  end


end