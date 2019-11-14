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

Package.destroy_all

# Make 20 packages, 2 for each user
puts "Making 5 packages for each user..."
User.all.each do |user|
  (1..3).to_a.sample.times do
    origin = Faker::Address.country.capitalize
    name = "#{origin} Package"
    description = "This wonderful package from #{origin} contains several original snacks"
    package = Package.new(user: user, name: name, price: (1..99).to_a.sample, origin: origin, description: description)
    package.remote_photo_url = "https://source.unsplash.com/1920x1080/?food"
    package.save!
    p package
  end
end
puts "Finished making packages..."

# Make 60 items, 3 for each package

puts "Making 3 to 6 items for each package..."
Package.all.each do |package|
  (2..4).to_a.sample.times do
    item = Item.new(package: package, name: Faker::Food.ingredient)
    item.remote_photo_url = "https://source.unsplash.com/500x500/?ingredient"
    item.save!
    p item
  end
end
puts "Finished making items..."

# Add images
# puts "Adding images to packages"
# Package.all.each do |p|
#   p.remote_photo_url = "https://source.unsplash.com/1080/?package,food"
#   p.save!
# end

# puts "Adding images to items"
# Package.all.each do |p|
#   p.items.each do |i|
#     i.remote_photo_url = "https://source.unsplash.com/500x500/?nature,water"
#     i.save!
#   end
# end
