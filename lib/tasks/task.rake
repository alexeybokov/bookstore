# frozen_string_literal:true

namespace :app do

  desc 'Drop exists database and create migration'
  task prepare_db: :environment do
    tasks = %w[db:drop db:create db:migrate db:seed]
    tasks.each { |t| Rake::Task[t].invoke }
  end

  desc 'Create data fo app'
  task create_data: :environment do
    tasks = %w[app:prepare_db
               app:create_categories
               app:create_authors
               app:create_books
            ]
    tasks.each { |t| Rake::Task[t].invoke }
  end

  desc 'Create fake categories'
  task create_categories: :environment do
    create_fake_categories
  end

  desc 'Create fake authors'
  task create_authors: :environment do
    create_fake_authors
  end

  desc 'Create fake books'
  task create_books: :environment do
    create_fake_books
  end

  # desc 'Create fake comments for images'
  # task create_comments: :environment do
  #   create_comments
  # end


  # def upload_images(category_title)
  #   Dir.chdir("#{Rails.root.to_s}/lib/assets/images/#{category_title}")
  #   image_paths = Dir['*.*']
  #   category = Category.find_by(title: category_title)
  #
  #   image_paths.each_with_index do |img_path, i|
  #     file_img = File.open(img_path)
  #     puts "\tUpload #{File.basename(img_path)}" if Image.create!(name: ('d_img_' + (i + 1).to_s),
  #                                                                 picture: file_img,
  #                                                                 user_id: 1,
  #                                                                 category_id: category.id)
  #     file_img.close
  #   end
  # end

  # def create_comments
  #   300.times do
  #     Comment.create!(user_id: User.first.id,
  #                     image_id: rand(1..45),
  #                     body: Faker::Lorem.sentence(15, true).chop)
  #   end
  #   puts 'Create comments..................................................................................'
  # end

  def create_fake_categories
    25.times do
      category = Category.new(title: Faker::Book.genre)
      if category.valid?
        category.save
        puts "Category: #{category.title} was create."
      else
        puts "Category already exist, try to create new Category............................................."
      end
    end
  end

  def create_fake_authors
    25.times do
      author = Author.new(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          biography: Faker::Lorem.sentence(25, true).chop
      )

      if author.valid?
        author.save
        puts "Author: #{author.first_name}" + ' ' + "#{author.last_name} was create."
      else
        puts "Something went wrong, try to create new Author................................................."
      end
    end
  end

  def create_fake_books
    50.times do
      book = Book.new(title: Faker::Book.title,
                      price: Faker::Number.decimal(2, 2),
                      description: Faker::Lorem.sentence(35, true).chop,
                      in_stock: rand(1..25),
                      author_id: rand(1..25),
                      category_id: rand(1..25)
      )
      if book.valid?
        book.save
        puts "Book: #{book.title} with price #{book.price} $, was create."
      else
        puts "Something went wrong, try to create new Book..................................................."
      end
    end
  end
end
