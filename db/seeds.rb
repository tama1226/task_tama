50.times do |n|
    name = Faker::Pokemon.name
    email = Faker::Internet.email
    password_digest = "pass"

    User.create(
      name: name,
      email: email,
      password_digest: password_digest
               )
  end
