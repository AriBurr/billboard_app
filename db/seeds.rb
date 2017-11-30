25.times do |n|
  name = Faker::BossaNova.artist
Artist.create!(name: name,
               genre: 'BossaNova')
end

25.times do |n|
  title = Faker::BossaNova.song
Song.create!(title: title,
             artist_id: rand(1..25),
             billboard_id: nil)
end
