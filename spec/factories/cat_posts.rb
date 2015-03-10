FactoryGirl.define do
  factory :cat_post do
    user              { create(:user, password: "helloworld") }
    caption           { Faker::Lorem.sentence }
    image_url         { Faker::Internet.url }
  end
end

