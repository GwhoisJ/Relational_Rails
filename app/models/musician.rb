# app/models/musician.rb

class Musician < ApplicationRecord
  belongs_to :orchestra

  def self.true?
    Musician.where(hirable: :true)
  end
end