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

User.create!(
  name: 'Guest',
             email: 'guest@example.com',
             password: '123456',
             password_confirmation: '123456',
             introduction: "I am 30. / engineer / Tokyo, Japan / love for music",
             artist: "ABC",
             created_at: Time.zone.now,
             updated_at: Time.zone.now,
             profile_image: File.open("./app/assets/images/guest.jpg")
)


# セットリスト
[
  ["Creepy Nuts", "2019-12-07 19:00:00", "ワンマンツアー 2019 「よふかしのうた」", "新木場STUDIO COAST (東京都)"],
  ["Age Factory", "2019-09-22 15:20:00", "山人音楽祭 2019", "榛名 at ヤマダグリーンドーム前橋 (群馬県)"],
  ["ONE OK ROCK", "2020-01-29 18:30:00", "ONE OK ROCK 2019 - 2020 「Eye of the Storm」 JAPAN TOUR", "国立代々木競技場 第一体育館 (東京都)"],
  ["BBHF", "2021-05-03 11:15:00", "VIVA LA ROCK 2021", "CAVE STAGE at さいたまスーパーアリーナ (埼玉県)"],
  ["Awesome City Club", "2021-05-22 19:50:00", "BAYCAMP 2021 「DOORS」", "DOORS STAGE at USEN STUDIO COAST (東京都)"],
  ["yonige", "2021-08-20 12:50:00", "FUJI ROCK FESTIVAL'21", "GREEN STAGE at 苗場スキー場 (新潟県)"]
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
  [2, "See you in my dream"],
  [3, "Eye of the Storm"],
  [3, "Take me to the top"],
  [3, "We are"],
  [3, "Taking Off"],
  [3, "Re:make"],
  [3, "Can't Wait"],
  [3, "Clock Strikes"],
  [3, "Head High"],
  [3, "Grow Old Die Young"],
  [3, "Change"],
  [3, "Worst in Me"],
  [3, "Be the light"],
  [3, "In the Stars"],
  [3, "Push Back"],
  [3, "キミシダイ列車"],
  [3, "じぶんROCK"],
  [3, "Giants"],
  [3, "The Beginning"],
  [3, "Mighty Long Fall"],
  [3, "Wasted Nights"],
  [4, "流氷"],
  [4, "恋の寿命 [Galileo Galilei]"],
  [4, "君はさせてくれる"],
  [4, "あこがれ"],
  [4, "真夜中のダンス"],
  [4, "Work"],
  [5, "Sing out loud, Bring it on down"],
  [5, "アウトサイダー"],
  [5, "Don't Think, Feel"],
  [5, "今夜だけ間違いじゃないことにしてあげる"],
  [5, "青春の胸騒ぎ"],
  [5, "まばたき"],
  [5, "勿忘"],
  [6, "11月24日"],
  [6, "ここじゃない場所"],
  [6, "2月の水槽"],
  [6, "バッドエンド週末"],
  [6, "往生際"],
  [6, "催眠療法"],
  [6, "わたしを見つけて"],
  [6, "子どもは見ている"],
  [6, "どこかのチャイム"],
  [6, "27歳"],
  [6, "サイケデリックイエスタデイ"],
  [6, "ピオニー"],
  [6, "トラック"],
  [6, "対岸の彼女"],
  [6, "最愛の恋人たち"]
].each do |setlist_id, title|
  Song.create!(
    { setlist_id: setlist_id, title: title }
  )
end

[
  [1, "スポットライト"],
  [1, "生業"],
  [3, "Stand Out Fit In"],
  [3, "完全感覚Dreamer"],
  [4, "夜汽車は走る"]
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

#フォロー
[
  [1, 7],
  [1, 3],
  [1, 5],
  [2, 1],
  [2, 3],
  [3, 2],
  [3, 1],
  [3, 4],
  [4, 1],
  [4, 3],
  [4, 5],
  [4, 7],
  [5, 2],
  [5, 6],
  [6, 2],
  [6, 5],
  [7, 1],
  [7, 3],
  [7, 6]
].each do |follower_id, followed_id|
  Relationship.create!(
    { follower_id: follower_id, followed_id: followed_id }
  )
end