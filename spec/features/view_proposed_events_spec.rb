require 'acceptance_spec_helper'

feature "View proposed events" do
  background do
    Event.create!(title: "Queen of the Damned",
                  description: "Here goes the description",
                  trailer_url: "https://youtu.be/v_qotd",
                  rate: 3)

    Event.create!(title: "The Bucket List",
                  description: "Awesome movie",
                  trailer_url: "https://youtu.be/v_bcklst",
                  rate: 2)
  end

  scenario "View list of proposed events" do
    visit "/"
    expect(page).to have_text("Queen of the Damned")
    expect(page).to have_text("The Bucket List")
  end
end

