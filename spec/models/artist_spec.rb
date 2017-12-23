require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe "Validations" do
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

  describe "Association" do
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

    it "has photo" do
      expect(photo.artist).to eq(artist)
    end
  end

  describe "Test methods" do

    let!(:artist) { create :artist, name: "z" }
    let!(:artist1) { create :artist, name: "c" }
    let!(:artist2) { create :artist, name: "a" }
    let!(:artist3) { create :artist, name: "g" }


    it "order by name ASC" do
      expect(Artist.order_by_name).to eq([artist2,artist1,artist3,artist])
    end

    it "order by name DESC" do
      expect(Artist.order_by_name("desc")).to eq([artist,artist3,artist1,artist2])
    end

    it "order by created_at ASC" do
      expect(Artist.order_by_created_at).to eq([artist,artist1,artist2,artist3])
    end

    it "order by created_at DESC" do
      expect(Artist.order_by_created_at("desc")).to eq([artist3,artist2,artist1,artist])
    end

  end


end
