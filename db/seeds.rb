# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Session.destroy_all
Entry.destroy_all
User.destroy_all

user1 = User.create(username: 'kcree', firstname: 'kelsey', password: 'apple')

session1 = Session.create(user_id: user1.id)
session2 = Session.create(user_id: user1.id)
session3 = Session.create(user_id: user1.id)

entry1 = Entry.create(item1: 'Mom', item2: 'Dad', item3: 'Sisters', user_id: user1.id)
entry2 = Entry.create(item1: 'Apartment', item2: 'Puppy', item3: 'Boyfriend', user_id: user1.id)
entry3 = Entry.create(item1: 'My bed', item2: 'Flatiron', item3: 'Steak', user_id: user1.id)
