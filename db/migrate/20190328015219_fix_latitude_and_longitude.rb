class FixLatitudeAndLongitude < ActiveRecord::Migration[5.2]
  def up
    Opportunity.all.each do |opportunity|
      if coordinates_reversed?(opportunity)
        lat, long = opportunity.longitude, opportunity.latitude
        opportunity.update!(latitude: lat, longitude: long)
      end
    end
  end

  def down
    Opportunity.all.each do |opportunity|
      unless coordinates_reversed?(opportunity)
        lat, long = opportunity.longitude, opportunity.latitude
        opportunity.update!(latitude: lat, longitude: long)
      end
    end
  end

  def coordinates_reversed?(opportunity)
    opportunity.latitude < 0
  end
end
