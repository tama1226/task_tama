FactoryBot.define do
  factory :user, class: User do
    name { "DIC" }
    email { "DIC@dic.com" }
    password { "password" }
    password_confirmation { 'password' }
  end
end
