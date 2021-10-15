require 'rails_helper'

RSpec.describe Musician, type: :model do
  before :each do
    @orchestra = Orchestra.create!(name:          "New York Philharmonic",
                                    city:          "New York City",
                                    hiring:        true,
                                    max_musicians: 100)
    @musician_1 = Musician.create(name:         "Nancy Drew",
                                      hirable:      true,
                                      age:          22,
                                      orchestra_id: @orchestra.id)
    @musician_2 = Musician.create(name:         "Michael Scott",
                                        hirable:      false,
                                        age:          50,
                                        orchestra_id: @orchestra.id)
  end
  it {should belong_to :orchestra}

  it '#true?' do
    expect(Musician.true?.length ).to eq 1
    expect(Musician.true?[0]).to eq @musician_1
    expect(Musician.true?.include?(@musician_2)).to be false
  end
end