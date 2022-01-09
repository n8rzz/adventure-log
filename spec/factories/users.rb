FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    name { Faker::Internet.username }
    password { 'passw0rd' }
    password_confirmation { 'passw0rd' }
  end
end
