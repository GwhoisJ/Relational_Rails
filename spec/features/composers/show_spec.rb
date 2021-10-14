require 'rails_helper'

RSpec.describe 'the composers show page' do
  before :each do
    @composer_1 = Composer.create!(name:        "Ludwig van Beethoven",
                                   nationality: "German",
                                   active:      false,
                                   total_songs: 722)
    @composer_2 = Composer.create!(name: "Andrew Brick",
                                   nationality: "American",
                                   active: true,
                                   total_songs: 100)
  end

  it 'displays the composer name' do
    visit "/composers/#{@composer_1.id}"
    expect(page).to have_content(@composer_1.name)

    visit "/composers/#{@composer_2.id}"
    expect(page).to have_content(@composer_2.name)
  end

  it 'displays the composer nationality' do
    visit "/composers/#{@composer_1.id}"
    expect(page).to have_content("Nationality: #{@composer_1.nationality}")

    visit "/composers/#{@composer_2.id}"
    expect(page).to have_content("Nationality: #{@composer_2.nationality}")
  end
end