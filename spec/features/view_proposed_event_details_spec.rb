require 'acceptance_spec_helper'

feature "View details of the proposed event" do
  background do
    Event.create!(title: "Queen of the Damned",
                  description: "Here goes the description",
                  trailer_url: "https://youtu.be/v_qotd",
                  rate: 3)
  end

  scenario "By clicking on proposed events list item" do
    visit "/"

    within "#proposed-events-list" do
      click_link "Queen of the Damned"
    end

    within ".proposed-event-details" do
      expect(page).to have_text("Here goes the description")
    end
  end
end

