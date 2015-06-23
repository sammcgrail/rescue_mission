# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "testemail@gmail.com", password: "secretlongpass", id: 2)
User.create!(email: "john@johns.com", password: "johnpass123", id: 3)
User.create!(email: "dude@johns.com", password: "sdfslkdjflksdjfl", id: 4)
User.create!(email: "theotherdude@johns.com", password: "dudepass1234135", id: 5)


Question.create!(title: "Test Question Title 1 40 characters for title", body: "Body test 1 Lorem ipsum 50 char body dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ", user_id: 2)
Question.create!(title: "Test Question Title 2 40 characters for title", body: "Lorem ipsum 2 50 char body dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ", user_id: 3)
Question.create!(title: "Test Question Title 3 40 characters for title", body: "Lorem ipsum 3 50 char body dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ", user_id: 4)
Question.create!(title: "Test Question Title 4 40 characters for title", body: "Lorem ipsum 4 50 char body dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ", user_id: 5)
