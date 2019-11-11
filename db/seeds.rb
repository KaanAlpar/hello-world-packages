# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make 10 users
User.destroy_all
puts "Making 10 users..."
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@gmail.com"
  user = User.new(password: Faker::DrivingLicence.uk_driving_licence, first_name: first_name, last_name: last_name, address: Faker::Nation.capital_city, email: email)
  user.save!
  p user
end
puts "Finished making users..."

# Make 20 packages, 2 for each user
Package.destroy_all
puts "Making 20 packages..."
User.all.each do |user|
  2.times do
   package = Package.new(user: user, name: Faker::Movies::HarryPotter.spell, price: (1..10).to_a.sample, origin: Faker::Nation.flag, description: Faker::Movies::HarryPotter.quote)
   package.save!
   p package
  end
end
puts "Finished making packages..."

# Make 60 items, 3 for each package

Item.destroy_all
puts "Making items..."
Package.all.each do |package|
  (3..6).to_a.sample.times do
    item = Item.new(package: package, name: Faker::Food.ingredient)
    item.save!
    p item
  end
end
puts "Finished making items..."
