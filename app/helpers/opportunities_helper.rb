module OpportunitiesHelper
  def opportunity_subtitle(opportunity)
    "#{opportunity.description} at #{opportunity.state_forest_name} State Forest"
  end

  def list_amenities(amenities)
    amenities || "N/A"
  end

  def google_map_url(opportunity)
    "https://www.google.com/maps/search/?api=1&query=#{opportunity.latitude},#{opportunity.longitude}"
  end
end
