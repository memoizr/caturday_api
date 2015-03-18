caturday_file = File.open("lib/assets/caturday_cats_urls.json", "rb")
caturday_urls = caturday_file.read
caturday_json = JSON.parse(caturday_urls)

boxes_file = File.open("lib/assets/boxes_cats_urls.json", "rb")
boxes_urls = boxes_file.read
boxes_json = JSON.parse(boxes_urls)

dream_file = File.open("lib/assets/dream_cats_urls.json", "rb")
dream_urls = dream_file.read
dream_json = JSON.parse(dream_urls)

sunglasses_file = File.open("lib/assets/sunglasses_cats_urls.json", "rb")
sunglasses_urls = sunglasses_file.read
sunglasses_json = JSON.parse(sunglasses_urls)

space_file = File.open("lib/assets/space_cats_urls.json", "rb")
space_urls = space_file.read
space_json = JSON.parse(space_urls)

hats_file = File.open("lib/assets/hats_cats_urls.json", "rb")
hats_urls = hats_file.read
hats_json = JSON.parse(hats_urls)

json_list =
  [
    {category: "hats",
     json: hats_json},

    {category: "space",
     json: space_json},

    {category: "sunglasses",
     json: sunglasses_json},

    {category: "dream",
     json: dream_json},

    {category: "caturday",
     json: caturday_json},

    {category: "boxes",
     json: boxes_json}
]


@user1 = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "foobartron", image_url: caturday_json["urls"].sample["url"] )
@user2 = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "foobartron", image_url: caturday_json["urls"].sample["url"] )
@user3 = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "foobartron", image_url: caturday_json["urls"].sample["url"] )
@user4 = User.create!(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "foobartron", image_url: caturday_json["urls"].sample["url"] )

def random_user
  [@user1, @user2, @user3, @user4].sample
end

json_list.each do |json_hash|

  category = json_hash[:category]
  json = json_hash[:json]

  json["urls"].each do |url|
    cat_post = CatPost.create!(image_url: url["url"], category: category, user_id: random_user.id, caption: Faker::Lorem.sentence(2, false, 2))
    [*0..4].sample.times {
      Reshare.create!(reshareable_id: cat_post.id, reshareable_type: "CatPost", user_id: random_user.id)
    }
    [*0..8].sample.times {
      Vote.create!(voteable_id: cat_post.id, voteable_type: "CatPost", positive: [1, 1, 0].sample, user_id: random_user.id)
    }
    [*0..20].sample.times {
      comment = Comment.create!(commentable_id: cat_post.id, commentable_type: "CatPost", content: Faker::Lorem.sentence(5, false, 5), user_id: random_user.id)
      [*0..3].sample.times {
        Vote.create!(voteable_id: comment.id, voteable_type: "Comment", positive: [1, 0, 1].sample, user_id: random_user.id)
      }
    }
  end
end
