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

  scenario "user filters recreational opportunities" do
    OdfDataImport.new.import

    visit root_path

    expect(page).to have_selector ".card", count: 63

    check "Clatsop"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 14

    check "Santiam"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 23

    uncheck "Santiam"
    uncheck "Clatsop"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 63
  end
end
