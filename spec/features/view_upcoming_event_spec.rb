require 'acceptance_spec_helper'

feature "View upcoming event" do
  background do
    Event.create!(title: "An upcoming event",
                  description: "Upcoming event description",
                  scheduled_for: Date.today + 1.day)
  end

  scenario "For user who is already logged in" do
    login_as test_user
    visit "/"
    within "#upcoming-event" do
      expect(page).to have_text("An upcoming event")
      expect(page).to have_text("Upcoming event description")
      expect(page).to have_css("time[datetime='#{Date.today + 1.day}']")
    end
  end

end
