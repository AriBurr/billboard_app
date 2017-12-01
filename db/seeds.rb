Billboard.create(name: 'Bossa Nova Classics')

25.times do
  name = Faker::BossaNova.artist
  Artist.create(name: name,
                 genre: 'Bossa Nova')
end

25.times do
  title = Faker::BossaNova.song
  Song.create(title: title,
               artist_id: rand(1..25),
               billboard_id: nil)
end
