1000.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )

  Post.create(
    title: Faker::Movie.title,
    content: Faker::Movie.quote,
    user: user
  )
end
