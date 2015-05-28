require 'faker'
# create users
me = User.new(
  name: "Cole C.",
  email: "combswc@gmail.com",
  password: "password",
  avatar: "arnold.jpg"
)
me.skip_confirmation!
me.save

user_one = User.new(
  name: "Daisy",
  email: "dribble@gmail.com",
  password: "password",
  avatar: "crossfit.jpg"
)
user_one.skip_confirmation!
user_one.save

user_two = User.new(
  name: "Barbie",
  email: "kibble@gmail.com",
  password: "password",
  avatar: "rambo.jpg"
)
user_two.skip_confirmation!
user_two.save

user_three = User.new(
  name: "Kitty",
  email: "claws@gmail.com",
  password: "password",
  avatar: "User1.jpg"
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
    workout:      workout.sample,
    name:         Faker::Lorem.word,
    description:  Faker::Lorem.sentence
  )
end
exercises = Exercise.all

# Create sets
300.times do
  Ex_Set.create!(
    exercise:    exercise.sample,
    order:       "1",
    reps:        "15",
    weight:      "100"
    )
end
sets = Set.all

#Create weights
100.times do
  Weight.create!(
  user:         user.sample,
  value:        Faker::Number.number
  )
end
weights = Weight.all

puts "#{Workout.count} workouts created!"
puts "#{Exercise.count} exercises created!"
puts "#{Set.count} sets created!"
puts "#{Weight.count} weights created!"
puts "Seeds Completed!"
