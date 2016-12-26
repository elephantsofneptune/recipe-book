# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
	username: "anonymous",
	email: "anonymous@whatscooking.com",
	password: "1234Qwer",
	public: false)

User.create!(
	username: "admin",
	email: "admin@whatscooking.com",
	password: "admin",
	access_level: 1)

User.create!(
	username: "visitor",
	email: "visitor@whatscooking.com",
	password: "visitor",
	)