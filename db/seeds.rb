# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

posts = [
  { title: 'title 0', description: 'description 0', body: 'body 0' },
  { title: 'title 1', description: 'description 1', body: 'body 1' },
  { title: 'title 2', description: 'description 2', body: 'body 2' },
  { title: 'title 3', description: 'description 3', body: 'body 3' }
]

posts.each do |post|
  Post.create title: post[:title],
              description: post[:description],
              body: post[:body]
end