FactoryGirl.define do
  factory :vote do
    user_id           { create(:user, password: "helloworld").id }
    voteable_type     { "CatPost" }
    voteable_id       { create(:cat_post).id }
    positive          { true }

    trait :correct do
      after(:create) do |vote|
        vote.positive = true
        vote.set(positive: true)
      end
    end

    trait :incorrect do
      after(:create) do |vote|
        vote.positive = false
        vote.set(positive: false)
      end
    end
  end
end
