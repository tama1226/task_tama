50.times do |n|
    name = Faker::Name.name
    content =  "task1"

    Task.create(
      name: name,
      content: content,
               )
  end
