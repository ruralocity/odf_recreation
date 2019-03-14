require "spec_helper"

describe "ODF data import" do
  it "finds 63 records" do
    data = OdfDataImport.new.data
    expect(data.length).to eq 63
  end

  it "parses an individual record" do
    data = OdfDataImport.new.data
    expect(data.first).to eq(
      {
        ":@computed_region_i25a_xk5b" => "2412",
        "amentities" => "restrooms; picnic tables",
        "contact_number" => "503-815-6800",
        "description" => "Visitor Center",
        "district" => "Forest Grove",
        "location" => {
          "type" => "Point",
          "coordinates" => [-123.560477, 45.586471]
        },
        "name" => "Tillamook Forest Center",
        "number_of_sites" => "N/A",
        "overnight_fee" => "N/A",
        "season" => "March - November",
        "state_forest" => "Tillamook",
        "type" => "Hike, Day Use"
      }
    )
  end

  it "imports opportunities" do
    OdfDataImport.new.import

    forest_grove_district = District.find_by(name: "Forest Grove")
    tillamook_state_forest = StateForest.find_by(name: "Tillamook")

    expect(Opportunity.count).to eq 63
    expect(Opportunity.first).to have_attributes(
      computed_region: 2412,
      amenities: "restrooms; picnic tables",
      contact_number: "503-815-6800",
      description: "Visitor Center",
      district: forest_grove_district,
      latitude: -123.560477,
      longitude: 45.586471,
      name: "Tillamook Forest Center",
      number_of_sites: "N/A",
      overnight_fee: "N/A",
      season: "March - November",
      state_forest: tillamook_state_forest,
      # type: "Hike, Day Use",
    )
  end

  it "gathers a list of state forests" do
    data = OdfDataImport.new
    expect(data.state_forests).to eq [
      "Tillamook",
      "Clatsop",
      "Santiam",
    ]
  end

  it "gathers a list of districts" do
    data = OdfDataImport.new
    expect(data.districts).to eq [
      "Forest Grove",
      "Astoria",
      "Tillamook",
      "North Cascade",
    ]
  end
end
