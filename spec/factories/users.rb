FactoryGirl.define do
  factory :user do
    first_name          { Faker::Name.first_name }
    last_name           { Faker::Name.last_name }
    username            { Faker::Internet.user_name.gsub(/\./, '') }
    description         { Faker::Lorem.sentence }
    email               { Faker::Internet.email }
    encrypted_password  { "sha1$rHAi0vcS$a7808f319885964aba6dde8b9b784fc545f3715a" } # secret
    #password_digest    { "a7808f319885964aba6dde8b9b784fc545f3715a" } # secret
  end
end
