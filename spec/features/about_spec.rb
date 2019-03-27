require "rails_helper"

RSpec.feature "About page", type: :feature do
  scenario "User views about page" do
    visit root_path
    click_link "About this Project"

    expect(page).to have_current_path about_path
    expect(page).to have_selector "h1", text: "About this Project"
  end
end
