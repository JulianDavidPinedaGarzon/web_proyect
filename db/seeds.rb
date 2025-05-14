# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Post.destroy_all
Comment.destroy_all
Hashtag.destroy_all
Like.destroy_all
PostsHashtag.destroy_all

#   Create users
user1 = User.create!(username: 'john_doe', email: 'john.doe@example.com', password_digest: 'password123', bio: 'Software Engineer', profile_picture_path: 'path/to/john.jpg')
user2 = User.create!(username: 'jane_smith', email: 'jane.smith@example.com', password_digest: 'password456', bio: 'Web Developer', profile_picture_path: 'path/to/jane.jpg')
user3 = User.create!(username: 'alice_wonderland', email: 'alice.wonderland@example.com', password_digest: 'password789', bio: 'UX Designer', profile_picture_path: 'path/to/alice.jpg')

#   Create posts
post1 = user1.posts.create!(image_path: 'path/to/image1.jpg', description: 'Beautiful landscape')
post2 = user1.posts.create!(image_path: 'path/to/image2.jpg', description: 'My favorite city')
post3 = user2.posts.create!(image_path: 'path/to/image3.jpg', description: 'Amazing sunset')
post4 = user3.posts.create!(image_path: 'path/to/image4.jpg', description: 'New Design')

#   Create comments
post1.comments.create!(user: user2, content: 'Great photo!')
post1.comments.create!(user: user3, content: 'I agree!')
post2.comments.create!(user: user1, content: 'Where is this?')
post3.comments.create!(user: user3, content: 'Stunning!')
post4.comments.create!(user: user1, content: 'Nice work')

#   Create hashtags
hashtag1 = Hashtag.create!(name: 'landscape')
hashtag2 = Hashtag.create!(name: 'city')
hashtag3 = Hashtag.create!(name: 'sunset')
hashtag4 = Hashtag.create!(name: 'design')

#   Create likes
Like.create!(user: user1, post: post3)
Like.create!(user: user2, post: post1)
Like.create!(user: user2, post: post2)
Like.create!(user: user3, post: post1)
Like.create!(user: user3, post: post4)

#   Create PostsHashtags
PostsHashtag.create!(post: post1, hashtag: hashtag1)
PostsHashtag.create!(post: post2, hashtag: hashtag2)
PostsHashtag.create!(post: post3, hashtag: hashtag3)
PostsHashtag.create!(post: post4, hashtag: hashtag4)
PostsHashtag.create!(post: post1, hashtag: hashtag3) #   post1 has both landscape and sunset

puts "Users, Posts, Comments, Hashtags, Likes, and PostsHashtags created!"  