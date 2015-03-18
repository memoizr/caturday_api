FactoryGirl.define do
  factory :cat_post do
    user_id              { create(:user, password: "helloworld").id }
    caption           { Faker::Lorem.sentence }
    image_url         { Faker::Internet.url }
  end
end

