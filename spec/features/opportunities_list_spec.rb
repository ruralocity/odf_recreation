require 'rails_helper'

RSpec.feature "Opportunities list", type: :feature do
  scenario "user views list of available recreational opportunities" do
    visit root_path
    expect(page).to have_content "ODF recreational opportunities"
  end
end
