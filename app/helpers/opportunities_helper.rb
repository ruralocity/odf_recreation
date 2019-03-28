module OpportunitiesHelper
  def list_amenities(amenities)
    amenities || "N/A"
  end

  def google_map_url(opportunity)
    "https://www.google.com/maps/search/?api=1&query=#{opportunity.longitude},#{opportunity.latitude}"
  end
end
