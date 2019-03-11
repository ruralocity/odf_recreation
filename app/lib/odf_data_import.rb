class OdfDataImport
  def initialize
    @data = JSON.parse(File.read(Rails.root.join("data.json")))
  end

  def data
    @data
  end

  def state_forests
    @data.collect { |row| row["state_forest"] }.uniq
  end
end
