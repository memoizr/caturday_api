file = File.open("lib/assets/cat_urls.json", "rb")
urls = file.read

json = JSON.parse(urls)

user = User.create(email: "foo@bar.com", username: "cat#3", password: "foobar")

json["urls"].each do |url|
  CatPost.create!(image_url: url["url"], user: user, caption: Faker::Lorem.sentence(2, false, 2), likes: [*0..42].sample)
end
