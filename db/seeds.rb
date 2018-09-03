# frozen_string_literal: true

Order.destroy_all
Author.destroy_all
Book.destroy_all
Category.destroy_all
User.destroy_all


User.create(email: 'admin@gmail.com',
            password: 'admin')


5.times do |index|
  category = Category.create!(title: Faker::Book.title)


  15.times do
    book = Book.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.sentence(50, true).chop,
      price: Faker::Commerce.price,
      in_stock: Faker::Commerce.price(range = 1..10),
      author: Author.first,
      category: category
    )

    Author.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      biography: Faker::Lorem.paragraph(3, true),
      books: [book]
    )
  end
end
