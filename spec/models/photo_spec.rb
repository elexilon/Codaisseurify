require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "association" do
    let!(:artist) { create :artist }
    let!(:photo) { create :photo, artist: artist }

    it "has artist" do
      expect(photo.artist).to eq(artist)
    end
  end
end
