class OdfDataImport
  def initialize
    @data = JSON.parse(File.read(Rails.root.join("data.json")))
  end

  def import
    @data.each do |opportunity|
      import_opportunity(opportunity)
    end
  end

  private

  def data
    @data
  end

  def import_opportunity(attributes)
    opportunity = Opportunity.create do |opp|
      opp.name = attributes["name"]
      opp.computed_region = attributes[':@computed_region_i25a_xk5b'].to_i
      opp.amenities = attributes["amentities"] # sic
      opp.contact_number = attributes["contact_number"]
      opp.description = attributes["description"]
      opp.district = District.find_or_create_by(name: attributes["district"])
      opp.latitude = attributes["location"]["coordinates"][1]
      opp.longitude = attributes["location"]["coordinates"][0]
      opp.number_of_sites = attributes["number_of_sites"]
      opp.overnight_fee = attributes["overnight_fee"]
      opp.season = attributes["season"]
      opp.state_forest = \
        StateForest.find_or_create_by(name: attributes["state_forest"])
    end
    import_types(opportunity, types: attributes["type"])
  end

  def import_types(opportunity, types: "")
    types = types.split(",").collect(&:strip).uniq
    types.each do |type|
      opportunity.types << Type.find_or_create_by(name: type)
    end
  end
end
