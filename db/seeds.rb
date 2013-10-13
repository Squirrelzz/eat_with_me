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
Character.find_or_create_by(name: "dog", image_url: "dog")

Meal.find_or_create_by(name: "apple") do |m|
  m.qualification = "a-good"
  m.points = 100
  m.image_url = "meal/apple.png"
end

Meal.find_or_create_by(name: "tomato") do |m|
  m.qualification = "a-good"
  m.points = 100
  m.image_url = "meal/tomato.png"
end

Meal.find_or_create_by(name: "broccoli") do |m|
  m.qualification = "a-good"
  m.points = 100
  m.image_url = "meal/broccoli.png"
end

Meal.find_or_create_by(name: "carrot") do |m|
  m.qualification = "a-good"
  m.points = 100
  m.image_url = "meal/carrot.png"
end

Meal.find_or_create_by(name: "spinach") do |m|
  m.qualification = "a-good"
  m.points = 100
  m.image_url = "meal/spinach.png"
end

Meal.find_or_create_by(name: "donut") do |m|
  m.qualification = "c-bad"
  m.points = 0
  m.image_url = "meal/donut.png"
end

Meal.find_or_create_by(name: "soda can") do |m|
  m.qualification = "c-bad"
  m.points = 0
  m.image_url = "meal/sodacan.png"
end

Meal.find_or_create_by(name: "cookie") do |m|
  m.qualification = "c-bad"
  m.points = 0
  m.image_url = "meal/cookie.png"
end

Meal.find_or_create_by(name: "ice cream") do |m|
  m.qualification = "c-bad"
  m.points = 0
  m.image_url = "meal/icecream.png"
end

Meal.find_or_create_by(name: "meat") do |m|
  m.qualification = "b-neutral"
  m.points = 20
  m.image_url = "meal/meat.png"
end

Meal.find_or_create_by(name: "milk") do |m|
  m.qualification = "b-neutral"
  m.points = 20
  m.image_url = "meal/milk.png"
end

Meal.find_or_create_by(name: "banana") do |m|
  m.qualification = "b-neutral"
  m.points = 20
  m.image_url = "meal/banana.png"
end

Meal.find_or_create_by(name: "bread") do |m|
  m.qualification = "b-neutral"
  m.points = 20
  m.image_url = "meal/bread.png"
end

Meal.find_or_create_by(name: "orange") do |m|
  m.qualification = "b-neutral"
  m.points = 20
  m.image_url = "meal/orange.png"
end
