Rental.destroy_all
Personnality.destroy_all
User.destroy_all

# user
10.times do
  name = Faker::Name.name
  age = [18..45].to_a.sample
  email = Faker::Internet.email
  password = 123456
  User.create!(name: name, age: age, email: email, password: password, remote_photo_url: 'http://lorempixel.com/200/200/people/')
end

# personnality
10.times do

  job = Faker::Company.profession
  friends = Faker::Pokemon.name
  main_emotion = %w(fear anger sadness depression joy disgust trust anticipation pity envy love shame kindness suffering weeping lust gluttony greed sloth wrath pride).sample
  user = User.all.sample
  name = Faker::Name.name
  age = [18..45].to_a.sample
  Personnality.create!(name: name, age: age, job: job, friends: friends, main_emotion: main_emotion, user: user, remote_photo_url: 'http://lorempixel.com/200/200/people/')
end

# rental
20.times do
  user = User.all.sample
  personnality = Personnality.all.sample
  start_date = Date.today
  end_date = Faker::Date.forward(60)
  status = "pending"
  Rental.create!(user: user, personnality: personnality, start_date: start_date, end_date: end_date, status: status)
end





