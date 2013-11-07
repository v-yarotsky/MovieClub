require 'acceptance_spec_helper'

feature "Propose an event" do
  scenario "Propose an event using form" do
    login_as test_user
    visit "/"
    click_on "Propose an event!"

    within "#proposed-event-form" do
      fill_in "event[title]", with: "BaDaBoo"
      fill_in "event[description]", with: "Bar"
      click_on "Submit"
    end

    within "#proposed-events-list" do
      expect(page).to have_text("BaDaBoo")
    end

    expect(Event.find_by_title("BaDaBoo")).to be
  end
end

