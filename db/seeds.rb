# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Speaker.create({first_name: "Dani", last_name: "Zaghian", email: "danielle@actualize.co"})

FFaker::Name.first_name
FFaker::Name.last_name
FFaker::Internet.email

9.times do
  speaker1 = Speaker.new(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, email: FFaker::Internet.email)

  speaker1.save
end