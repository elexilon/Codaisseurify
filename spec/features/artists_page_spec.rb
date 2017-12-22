require 'rails_helper'

describe "viewing the list of artists" do

  let!(:artist1) { create :artist, name: "Pepe"}
  let!(:artist2) { create :artist, name: "Jose Mota" }


  it "shows all artists" do
    visit root_path
    expect(page).to have_text("Pepe")
    expect(page).to have_text("Jose Mota")
  end

end
