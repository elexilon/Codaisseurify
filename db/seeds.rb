Artist.destroy_all


20.times do
  artist = Artist.create!(name:   Faker::FunnyName.name,
                   description:   Faker::Hipster.paragraph[0..496] << "...")

  10.times do
            Song.create!(name:    Faker::FunnyName.name,
                   artist:        artist)
  end
end

artist_count = Artist.count
puts "#{artist_count} artist were created."

song_count = Song.count
puts "#{song_count} song were created."
