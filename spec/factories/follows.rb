FactoryGirl.define do
  factory :follow do
    user_id           { create(:user, password: "helloworld").id }
    followable_type   { "User" }
    followable_id     { create(:user).id }
  end
end
