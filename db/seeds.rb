# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Session.destroy_all
Entry.destroy_all


user1 = User.create(username: 'kcree', firstname: 'kelsey', password: 'apple')

session1 = Session.create(user_id: user1)

entry1 = Entry.create(item1: 'mom', item2: 'dad', item3: 'sisters', user_id: user1)
