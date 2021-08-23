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
    introduction: "I am 2#{n + 1}. / engineer / Tokyo, Japan / love for music",
    artist: "xxx#{n + 1}",
    profile_image: File.open("./app/assets/images/test#{n + 1}.jpg")
  )
end


# セットリスト
[
  ["Creepy Nuts", "2019-12-07 19:00:00", "ワンマンツアー 2019 「よふかしのうた」", "新木場STUDIO COAST (東京都)"],
  ["Age Factory", "2019-09-22 15:20:00", "山人音楽祭 2019", "榛名 at ヤマダグリーンドーム前橋 (群馬県)"]
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
  [1, "助演男優賞"],
  [2, "CLOSE EYE"],
  [2, "WORLD IS MINE"],
  [2, "HIGH WAY BEACH"],
  [2, "GOLD"],
  [2, "TONBO"],
  [2, "See you in my dream"]
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

# スケジュール
[
  [1, "live", "ageのライブに行く！", "2021-08-31 19:00:00", "2021-08-31 21:00:00"],
  [1, "Fes", "fesに行く！", "2021-09-18 11:00:00", "2021-09-19 21:00:00"],
  [1, "live", "ageのライブに行く！", "2021-10-08 19:00:00", "2021-10-08 21:00:00"],
  [1, "live", "ageのライブに行く！", "2021-10-20 19:00:00", "2021-10-20 21:00:00"]
].each do |user_id, title, body, start_date, end_date|
  Schedule.create!(
    { user_id: user_id, title: title, body: body, start_date: start_date, end_date: end_date }
  )
end

# post
[
  ["Sweet Love Shower", "", "SPACE SHOWER SWEET LOVE SHOWER 2021", "3日間本当に楽しかった！age最前最高。来年も絶対きます。#ラブシャ", 1 , File.open("./app/assets/images/post1.jpg")]
].each do |title, artist, event, body, user_id, img|
  Post.create!(
    { title: title, artist: artist, event: event, body: body, user_id: user_id, image: img }
  )
end

[
  ["ラブシャ"]
].each do |hashname|
  Hashtag.create!(
    { hashname: hashname }
  )
end

[
  [1, 1]
].each do |post_id, hashtag_id|
  PostHashtagRelation.create!(
    { post_id: post_id, hashtag_id: hashtag_id }
  )
end