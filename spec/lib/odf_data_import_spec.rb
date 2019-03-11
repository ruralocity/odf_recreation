require "spec_helper"

describe "ODF data import" do
  it "finds 63 records" do
    data = OdfDataImport.new
    expect(data.import.length).to eq 63
  end
end
