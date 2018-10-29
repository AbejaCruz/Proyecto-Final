# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.new(username: 'Diego Cruz', phone: '3107942550', address: 'cll 58 s 98 a 22', email: 'diegoabeja@gmail.com', password: '123')
user.save(validate: false)
user.add_role(:admin)

Rake::Task['departments:seed'].invoke