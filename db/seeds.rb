# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "testemail@gmail.com", password: "secretlongpass", id: 2)
Question.create!(title: "Test Question Title 2", body: "Test Question Body 2", user_id: 2)
Question.create!(title: "Test Question Title 3", body: "Test Question Body 2", user_id: 2)
Question.create!(title: "Test Question Title 4", body: "Test Question Body 3", user_id: 2)
