require 'rails_helper'

RSpec.describe Song, type: :model do

  describe "validations" do
    it "is invalid without name" do
      song = Song.new(name: "")
      song.valid?
      expect(song.errors).to have_key(:name)
    end
  end

end
