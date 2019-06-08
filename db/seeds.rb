Label.create(name: 'label_6')
Label.create(name: 'label_7')
Label.create(name: 'label_8')

User.create(name: 'test1',
            email: 'test1@example.com',
            password: 'test1',
            password_confirmation: 'test1'
)

User.create(name: 'test2',
            email: 'test2@example.com',
            password: 'test2',
            password_confirmation: 'test2'
)

User.create(name: 'test3',
            email: 'test3@example.com',
            password: 'test3',
            password_confirmation: 'test3'
)

20.times do |n|
    name = "タスク名"
    content = "内容"
    Task.create!(name: name,
                 content: content
                 )
  end

