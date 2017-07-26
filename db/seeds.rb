# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
token1 = SecureRandom.uuid
token2 = SecureRandom.uuid
password = User.digest('password')

users = User.create([{name: 'John Smith', email: 'user@fake.ca', password_digest: password, type: 'User', invite_token: token1}, {name: 'Jane Doe', email: 'admin@fake.ca', password_digest: password, type: 'Admin', invite_token: token2}])

