require "spec_helper"

describe "ODF data import" do
  it "finds 63 records" do
    # The data method is now private; just keeping this test around for a
    # bit longer since it's a convenient way to confirm the JSON parsing
    # step is working ahead of the actual import.
    data = OdfDataImport.new.send(:data)
    expect(data.length).to eq 63
  end

  it "parses an individual record" do
    # The data method is now private; just keeping this test around for a
    # bit longer since it's a convenient way to confirm the JSON parsing
    # step is working ahead of the actual import.
    data = OdfDataImport.new.send(:data)
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

  it "imports all data" do
    OdfDataImport.new.import

    expect(District.count).to eq 4
    expect(StateForest.count).to eq 3
    expect(Type.count).to eq 9

    forest_grove_district = District.find_by(name: "Forest Grove")
    tillamook_state_forest = StateForest.find_by(name: "Tillamook")
    hiking = Type.find_by(name: "Hike")
    day_use = Type.find_by(name: "Day Use")

    expect(Opportunity.count).to eq 63

    opportunity = Opportunity.first
    expect(opportunity).to have_attributes(
      computed_region: 2412,
      amenities: "restrooms; picnic tables",
      contact_number: "503-815-6800",
      description: "Visitor Center",
      district: forest_grove_district,
      latitude: 45.586471,
      longitude: -123.560477,
      name: "Tillamook Forest Center",
      number_of_sites: "N/A",
      overnight_fee: "N/A",
      season: "March - November",
      state_forest: tillamook_state_forest,
    )
    expect(opportunity.types).to include hiking
    expect(opportunity.types).to include day_use
  end
end
