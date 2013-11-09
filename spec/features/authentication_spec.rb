require 'acceptance_spec_helper'

feature "Authentication" do
  scenario "Log in" do
    visit "/"
    expect(page).to have_no_content_within("#content")
    within ".authentication-login-form-dialog" do
      fill_in "email", with: test_user.email
      fill_in "password", with: test_user.password
    end
    click_on "Login"

    expect(page).to have_text("Sign Out")
  end

  scenario "Log out" do
    login_as test_user
    visit "/"
    click_on "Sign Out"
    expect(page).to have_text("SIGN IN")
    expect(page).to have_no_content_within("#content")
  end

  scenario "Visit link when not logged in" do
    Event.create!(title: "Queen of the Damned",
                  description: "Here goes the description",
                  trailer_url: "https://youtu.be/v_qotd",
                  rate: 3)

    visit "/#events/1"
    within ".authentication-login-form-dialog" do
      fill_in "email", with: test_user.email
      fill_in "password", with: test_user.password
    end
    click_on "Login"
    expect(page).to have_text("Here goes the description")
  end

  scenario "Authentication failure" do
    visit "/"
    expect(page).to have_no_content_within("#content")
    within ".authentication-login-form-dialog" do
      fill_in "email", with: "lol"
      fill_in "password", with: "ololo"
    end
    click_on "Login"

    expect(page).to have_text("Incorrect email or password")
  end
end

