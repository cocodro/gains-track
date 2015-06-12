require 'faker'
# create users
me = User.new(
  name: "Cole C.",
  email: "combswc@gmail.com",
  password: "password",
  picture: "arnold.jpg"
)
me.skip_confirmation!
me.save

user_one = User.new(
  name: "Daisy",
  email: "dribble@gmail.com",
  password: "password",
  picture: "crossfit.jpg"
)
user_one.skip_confirmation!
user_one.save

user_two = User.new(
  name: "Barbie",
  email: "kibble@gmail.com",
  password: "password",
  picture: "rambo.jpg"
)
user_two.skip_confirmation!
user_two.save

user_three = User.new(
  name: "Kitty",
  email: "claws@gmail.com",
  password: "password",
  picture: "User1.jpg"
)
user_three.skip_confirmation!
user_three.save

users = User.all

# Create Workouts
15.times do
  Workout.create!(
    location:     Faker::Lorem.word,
    description:  Faker::Lorem.sentence,
    user:         users.sample
  )
end
workouts = Workout.all

# Create Exercises
100.times do
  Exercise.create!(
    workout:      workouts.sample,
    name:         Faker::Lorem.word,
    description:  Faker::Lorem.sentence
  )
end
exercises = Exercise.all

# Create sets
300.times do
  ExSet.create!(
    exercise:    exercises.sample,
    order:       "1",
    reps:        "15",
    weight:      "100"
    )
end
sets = ExSet.all

#Create weights
weight = 310
bodyfat = 50.0
(0..70).to_a.reverse.each do |n|
  Weight.create!(
  user:         me,
  value:        (weight -= rand(2)),
  bodyfat:      (bodyfat -= rand(0.1).round(2)),
  created_at:   (DateTime.now - n.days)
  )
end
weights = Weight.all

puts "#{Workout.count} workouts created!"
puts "#{Exercise.count} exercises created!"
puts "#{ExSet.count} sets created!"
puts "#{Weight.count} weights created!"
puts "Seeds Completed!"
