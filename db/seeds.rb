require 'bcrypt'

10.times do |u|
  salt = BCrypt::Engine.generate_salt
  User.create!(
    name: "user_#{u + 1}",
    email: "user_#{u + 1}@fake.com",
    password: "password"
  )

  5.times do |q|
    Question.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(3, true, 2),
    user_id: u + 1
    )
  end
end

100.times do
  Answer.create!(
    body: Faker::Lorem.paragraph(2, true, 3),
    user_id: (rand(User.all.length) + 1),
    question_id: (rand(Question.all.length) + 1)
  )
end
