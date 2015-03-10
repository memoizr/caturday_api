FactoryGirl.define do
  factory :comment do
    user              { create(:user, password: "helloworld") }
    cat_post          { create(:cat_post) }
    content           { Faker::Lorem.sentence }
  end
end
