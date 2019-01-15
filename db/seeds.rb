# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!(tag: 'あいさつ')
Tag.create!(tag: '筋トレ全般')
Tag.create!(tag: 'ジムトレ')
Tag.create!(tag: '自宅トレ')
Tag.create!(tag: 'プロテイン')
Tag.create!(tag: 'サプリ')
Tag.create!(tag: '器具')
Tag.create!(tag: '初心者')
Tag.create!(tag: 'ボディビル')
Tag.create!(tag: 'フィジーク')
Tag.create!(tag: '大会')
Tag.create!(tag: 'ランニング')
Tag.create!(tag: 'ダイエット')
Tag.create!(tag: 'トレ記録')
Tag.create!(tag: 'BIG3')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?