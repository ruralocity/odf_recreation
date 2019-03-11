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

  it "gathers a list of state forests" do
    data = OdfDataImport.new
    expect(data.state_forests).to eq [
      "Tillamook",
      "Clatsop",
      "Santiam",
    ]
  end
end
