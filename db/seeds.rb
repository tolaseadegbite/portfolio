# Create a main sample user.
User.create!(display_name:  "Tolase Kelvin",
            username: "lashe",
             email: "lashe@lashe.dev",
             password:              "foobar",
             password_confirmation: "foobar",
            #  admin:     true,
            #  activated: true,
            #  activated_at: Time.zone.now
            )

# Generate a bunch of additional users.
99.times do |n|
  display_name  = Faker::Name.name
  username  = Faker::Internet.username
  email = "example-#{n+1}@lashe.dev"
  password = "password"
  User.create!(display_name:  display_name,
              username: username,
              email: email,
              password:              password,
              password_confirmation: password,
            #   activated: true,
            #   activated_at: Time.zone.now
            )
end

# Generate microposts for a subset of users.
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(word_count: 5)
#   users.each { |user| user.microposts.create!(content: content) }
# end

# Create following relationships.
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }