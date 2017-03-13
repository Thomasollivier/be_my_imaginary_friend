# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
10.times do
  email = Faker::Internet.email
  password = 123456
  User.create(email: email, password: password)
end

# personnality
10.times do
  job = Faker::Company.profession
  friends = Faker::Pokemon.name
  main_emotion = %w(fear anger sadness depression joy disgust trust anticipation pity envy love shame kindness suffering weeping lust gluttony greed sloth wrath pride).sample
  user = User.all.sample
  name = Faker::Name.name
  age = [18..45].to_a.sample
  Personnality.create(name: name, age: age, job: job, friends: friends, main_emotion: main_emotion, user: user)
end

# rental
20.times do
  user = User.all.sample
  personnality = Personnality.all.sample
  start_date = Date.today
  end_date = Faker::Date.forward(60)
  status = "pending"
  Rental.create(user: user, personnality: personnality, start_date: start_date, end_date: end_date, status: status)
end

User.all.each do |user|
  user.name = Faker::Name.name
  user.age = [18..45].to_a.sample
  user.save!
end

Personnality.all.each do |p|
  user = User.find(p.user)
  p.name = user.name
  p.age = user.age
  p.save!
end

