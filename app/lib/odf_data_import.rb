class OdfDataImport
  def import
    JSON.parse(File.read(Rails.root.join("data.json")))
  end
end
