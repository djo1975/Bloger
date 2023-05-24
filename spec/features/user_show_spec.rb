# require 'rails_helper'
# require 'capybara/rspec'

# RSpec.describe "User Show", type: :feature do
#   before do
#     # Set up any necessary data or configurations
#     User.create(id: 1, name: "User 1", posts_counter: 5)
#     User.create(name: "User 2", posts_counter: 10)

#     user1 = User.find(1)
#     user1.posts.create(title: "Post 1", text: "Lorem ipsum dolor sit amet.")
#     user1.posts.create(title: "Post 2", text: "Consectetur adipiscing elit.")
#     user1.posts.create(title: "Post 3", text: "Nulla vestibulum, nisi nec ullamcorper.")
#   end

#   it "displays the user's profile picture" do
#     visit user_path(1)

#     expect(page).to have_selector(".user-profile img")
#   end

#   it "displays the user's username" do
#     visit user_path(1)

#     expect(page).to have_content("User 1")
#   end

#   it "displays the number of posts the user has written" do
#     visit user_path(1)

#     expect(page).to have_content("Number of posts: 5")
#   end

#   it "displays the user's bio" do
#     visit user_path(1)

#     expect(page).to have_selector(".bio p")
#   end

#   it "displays the user's first 3 posts" do
#     visit user_path(1)

#     expect(page).to have_content("Post 1", count: 1)
#     expect(page).to have_content("Post 2", count: 1)
#     expect(page).to have_content("Post 3", count: 1)
#   end

#   it "redirects to the post's show page when clicked" do
#     visit user_path(1)

#     click_link "Post 1"
#     expect(page).to have_current_path(user_post_path(user_id: 1, id: 1))
#   end

#   it "redirects to the user's post index page when clicked" do
#     visit user_path(1)

#     click_link "See All Posts"
#     expect(page).to have_current_path(user_posts_path(user_id: 1))
#   end
# end
