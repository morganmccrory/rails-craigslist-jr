require 'faker'

5.times do
  Category.create(title: Faker::Lorem.word)
end

Category.all.each do |x|
  x.articles.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, email: Faker::Internet.email, price: rand(100))
end
