require 'rails_helper'

RSpec.feature "Opportunities list", type: :feature do
  scenario "user views list of available recreational opportunities" do
    FactoryBot.create(:opportunity, name: "First opportunity")
    FactoryBot.create(:opportunity, name: "Second opportunity")

    visit root_path
    expect(page).to have_content "ODF recreational opportunities"

    expect(page).to have_content "First opportunity"
    expect(page).to have_content "Second opportunity"
  end
end
