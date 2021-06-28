# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "test@test.com",
             name: "test",
             password: "123123",
             password_confirmation: "123123") if Rails.env.development?

3.times do |blog|
  Blog.create!(
    title: "My blog #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: 1,
  ) if Rails.env.development?
end

Blog.last.comments.create!([{ content: "This is a very good post", user_id: 1 },
                            { content: "I agree with all of this", user_id: 1 },
                            { content: "I don't agree with all of this", user_id: 1 }])
User.create!(email: "admin@example.com", name: "Admin Example", password: "password", password_confirmation: "password", superadmin: true) if Rails.env.development?
