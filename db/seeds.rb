# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Category.create(title: 'Mobile')
  Category.create!(title: 'Development')
  # Category.create(title: 'Photo')
  # Category.create(title: 'Web design')
  # Category.create(title: 'Web development')

25.times do
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    biography: Faker::Lorem.paragraph(3, true)
    )
end

25.times do
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.sentence(50, true).chop,
    price: Faker::Commerce.price,
    in_stock: Faker::Commerce.price(range = 1..10),
    author: Author.first,
    category: Category.last
    )
end
