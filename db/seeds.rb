# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |i|
  User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      avatar: Faker::Avatar.image,
      password: '123123'
  )
end

20.times do |i|
  Message.create(

      title: Faker::Job.title,
      body: Faker::ChuckNorris.fact,
      sender_id: Faker::Number.between(1, 10),
      recipient_id: Faker::Number.between(1, 10),

  )
end