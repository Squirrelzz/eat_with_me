# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by(email: "user@example.com") do |u|
  u.password = "example"
end

Person.find_or_create_by(name: "Donny", user: user)

Character.find_or_create_by(name: "bear", image_url: "bear")
Character.find_or_create_by(name: "rabbit", image_url: "rabbit")
Character.find_or_create_by(name: "cat", image_url: "cat")
Character.find_or_create_by(name: "dog", image_url: "bear")

Meal.find_or_create_by(name: "tomato") do |m|
  m.qualification = "good"
  m.points = 100
  m.image_url = "tomato"
end

Meal.find_or_create_by(name: "corn") do |m|
  m.qualification = "good"
  m.points = 100
  m.image_url = "corn"
end

Meal.find_or_create_by(name: "asparagus") do |m|
  m.qualification = "good"
  m.points = 100
  m.image_url = "asparagus"
end

Meal.find_or_create_by(name: "broccoli") do |m|
  m.qualification = "good"
  m.points = 100
  m.image_url = "broccoli"
end

Meal.find_or_create_by(name: "spinach") do |m|
  m.qualification = "good"
  m.points = 100
  m.image_url = "spinach"
end

Meal.find_or_create_by(name: "candy") do |m|
  m.qualification = "bad"
  m.points = 0
  m.image_url = "candy"
end

Meal.find_or_create_by(name: "chocolate milk") do |m|
  m.qualification = "bad"
  m.points = 0
  m.image_url = "chocolatemilk"
end

Meal.find_or_create_by(name: "donut") do |m|
  m.qualification = "bad"
  m.points = 0
  m.image_url = "donut"
end

Meal.find_or_create_by(name: "soda can") do |m|
  m.qualification = "bad"
  m.points = 0
  m.image_url = "sodacan"
end

Meal.find_or_create_by(name: "banana") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "banana"
end

Meal.find_or_create_by(name: "bread") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "bread"
end

Meal.find_or_create_by(name: "corn") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "corn"
end

Meal.find_or_create_by(name: "juice") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "juice"
end

Meal.find_or_create_by(name: "orange") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "orange"
end

Meal.find_or_create_by(name: "peach") do |m|
  m.qualification = "neutral"
  m.points = 20
  m.image_url = "peach"
end
