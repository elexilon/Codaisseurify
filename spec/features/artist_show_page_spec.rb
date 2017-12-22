require 'rails_helper'

describe "viewing the list of songs" do

  let!(:artist1) { create :artist, name: "Pepe"}
  let!(:song1) { create :song, name: "50 cent", artist: artist1 }

  it "shows all songs" do
    visit artist_url(artist1)
    expect(page).to have_text(song1.name)
  end

end
