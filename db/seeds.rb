# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make 10 users
10.times do
  user = User.new(email: Faker::Internet.email, password: Faker::DrivingLicence.uk_driving_licence, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Nation.capital_city)
  user.save!
end

# Make 20 packages, 2 for each user
User.all.each do |user|
  2.times do
   package = Package.new(user: user, name: Faker::Movies::HarryPotter.spell, price: (1..10).to_a.sample, origin: Faker::Nation.flag, description: Faker::Movies::HarryPotter.quote)
   package.save!
  end
end

# Make 60 items, 3 for each package

Package.all.each do |package|
  (3..6).to_a.sample.times do
    item = Item.new(package: package, name: Faker::Food.ingredient)
    item.save!
  end
end
