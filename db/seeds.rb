# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
7.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "user#{n + 1}",
    password: '123456',
    password_confirmation: '123456',
    profile_image: File.open("./app/assets/images/test#{n + 1}.jpg")
  )
end


[
  ["Creepy Nuts", "2019-12-07 19:00:00", "ワンマンツアー 2019 「よふかしのうた」", "新木場STUDIO COAST (東京都)"]
].each do |artist, date, event, venue|
  Setlist.create!(
    { artist: artist, date: date, event: event, venue: venue }
  )
end

[
  [1, "板の上の魔物"],
  [1, "手練手管"],
  [1, "紙様"],
  [1, "犬も食わない"],
  [1, "助演男優賞"]
].each do |setlist_id, title|
  Song.create!(
    { setlist_id: setlist_id, title: title }
  )
end

[
  [1, "スポットライト"],
  [1, "生業"]
].each do |setlist_id, title|
  Encore.create!(
    { setlist_id: setlist_id, title: title }
  )
end