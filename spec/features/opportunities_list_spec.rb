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
    expect(page).to have_content "Showing 63 opportunities"

    check "Clatsop"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 14
    expect(page).to have_content "Showing 14 opportunities"

    check "Santiam"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 23
    expect(page).to have_content "Showing 23 opportunities"

    uncheck "Santiam"
    uncheck "Clatsop"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 63
    expect(page).to have_content "Showing 63 opportunities"

    check "Clatsop"
    check "Hike"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 10
    expect(page).to have_content "Showing 10 opportunities"

    check "Day Use"
    click_button "Filter"

    expect(page).to have_selector ".card", count: 15
    expect(page).to have_content "Showing 15 opportunities"

    click_link "Reset filters"

    expect(page).to have_selector ".card", count: 63
    expect(page).to have_content "Showing 63 opportunities"
  end
end
