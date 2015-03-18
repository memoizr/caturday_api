FactoryGirl.define do
  factory :comment do
    user_id           { create(:user, password: "helloworld").id }
    commentable_type  { "CatPost" }
    commentable_id    { create(:cat_post).id }
    content           { Faker::Lorem.sentence }
  end
end
