require 'rails_helper'

RSpec.describe 'Orchestras Index' do
  before :each do
    @orchestra_1 = Orchestra.create!(name:          "New York Philharmonic",
                                     city:          "New York City",
                                     hiring:        true,
                                     max_musicians: 100)
    @orchestra_2 = Orchestra.create!(name:          "Boston Pops",
                                     city:          "Boston",
                                     hiring:        false,
                                     max_musicians: 120)
  end

  it '#name' do
    visit "/orchestras/"

    expect(page).to have_content(@orchestra_1.name)
    expect(page).to have_content(@orchestra_2.name)
  end

  it '#home' do
    visit "/orchestras/"

    expect(page).to have_link("Home")
  end

  it '#new' do
    visit "/orchestras/"

    expect(page).to have_link("New Orchestra")
  end

  it 'show created at time' do
    visit "/orchestras/"

    expect(page).to have_content("#{@orchestra_1.created_at}")
    expect(page).to have_content("#{@orchestra_2.created_at}")
  end

  it 'nav' do
    visit "/orchestras/"

    expect(page).to have_link("Home")
    expect(page).to have_link("Orchestras")
    expect(page).to have_link("Musicians")
    expect(page).to have_link("Composers")
    expect(page).to have_link("Songs")
  end

  it 'edit' do
    visit "/orchestras/"

    expect(page).to have_link("Edit")
  end

  it 'delete' do
    visit "/orchestras/"

    expect(page).to have_button("Delete")
  end
end