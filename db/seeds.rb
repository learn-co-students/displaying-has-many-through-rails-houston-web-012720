# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

10.times do
  name = Faker::Name.name 
  email = Faker::Internet.email(name: name, separators: '.')
  User.create(username: name, email: email)
end

5.times do
  title = Faker::ChuckNorris.fact
  content = []
  7.times do
    content << Faker::ChuckNorris.fact
  end
  Post.create(title: title, content: content.join(" "))
end

30.times do
  post = Post.all.sample
  user = User.all.sample
  Comment.create(user_id: user.id, post_id: post.id, content: Faker::ChuckNorris.fact)
end

