require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe "validations" do
    it "is invalid without name" do
      artist = Artist.new(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid without description" do
      artist = Artist.new(description: "")
      artist.valid?
      expect(artist.errors).to have_key(:description)
    end
  end

  describe "association" do
    let!(:artist) { create :artist }
    let!(:song1)  { create :song, artist: artist }
    let!(:song2)  { create :song, artist: artist }
    let!(:song3)  { create :song, artist: artist }
    let!(:photo)  { create :photo, artist: artist }

    it "has songs" do
      expect(artist.songs).to include(song2)
      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song3)
    end

    it "have photo" do
      expect(photo.artist).to eq(artist)
    end
  end

end
