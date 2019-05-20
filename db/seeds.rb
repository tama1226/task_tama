50.times do |n|
    name = Faker::Name.name
    content =  "task1"

    Task.create(
      name: name,
      content: content,
               )
  end

  30.times do |n|
    name = Faker::Job.name
    email = Faker::Internet.email
    password_digest = "pass"
    User.create(name: name,
                 email: email,
                 password_digest: password_digest
                 )
  end

