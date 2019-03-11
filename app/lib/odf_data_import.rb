class OdfDataImport
  def initialize
    @data = JSON.parse(File.read(Rails.root.join("data.json")))
  end

  def data
    @data
  end
end
