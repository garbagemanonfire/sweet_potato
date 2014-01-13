# namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     make_users
#     make_retreatregs
#   end
# end

# def make_users
#   admin = User.create!(name:     "Example User",
#                        email:    "example@email.com",
#                        password: "password",
#                        password_confirmation: "password",
#                        admin: true)
#   99.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1}@email.com"
#     password  = "password"
#     User.create!(name:     name,
#                  email:    email,
#                  password: password,
#                  password_confirmation: password)
#   end
# end

# def make_retreatregs
#   users = User.all
#   user  = users.first
#   event_users = users[2..50]
#   followers      = users[3..40]
#   event_users.each { |event| user.follow!(event) }
#   followers.each      { |follower| follower.follow!(user) }
# end