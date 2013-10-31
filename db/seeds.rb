require 'faker'

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, username: Faker::Company.name, password: 'password')
end

30.times do
  Post.create(post_title: Faker::Company.catch_phrase, post_text: Faker::Lorem.paragraph(sentence_count = 4), user_id: User.all.to_a.sample.id)
end

10.times do
  Tag.create(tag_title: Faker::Company.bs)
end

60.times do
  PostTag.create(tag_id: Tag.all.to_a.sample.id, post_id: Post.all.to_a.sample.id)
end

150.times do
  Comment.create(comment_text: Faker::Company.bs, post_id: Post.all.to_a.sample.id)
end