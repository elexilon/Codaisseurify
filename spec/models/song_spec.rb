require 'rails_helper'

RSpec.describe Song, type: :model do

  describe "validations" do
    it "is invalid without name" do
      song = Song.new(name: "")
      song.valid?
      expect(song.errors).to have_key(:name)
    end
  end

  describe "association" do
    let!(:artist) { create :artist }
    let!(:song1)  { create :song, artist: artist }

    it "has artist" do
      expect(song1.artist).to eq(artist)
    end
  end

end
