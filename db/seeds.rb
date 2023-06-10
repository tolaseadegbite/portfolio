# Create a main sample user.
User.create!(display_name:  "Tolase Kelvin",
            username: "lashe",
             email: "lashe@lashe.dev",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
            #  activated: true,
            #  activated_at: Time.zone.now
            )

# Generate a bunch of additional users.
99.times do |n|
  display_name  = Faker::Name.name
  username  = Faker::Internet.username
  username = "#{username}_#{n}"
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

# Generate projects for a subset of users.
user = User.first
50.times do
  title = Faker::Lorem.sentence(word_count: 4)
  description = Faker::Lorem.sentence(word_count: 100)
  github_link = Faker::Internet.url
  preview_link = Faker::Internet.url
  user.projects.create!(title: title, description: description, github_link: github_link, preview_link: preview_link)
end
