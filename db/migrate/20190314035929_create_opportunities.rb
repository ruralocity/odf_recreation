class CreateOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.integer :computed_region
      t.string :amenities
      t.string :contact_number
      t.string :description
      t.references :district, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :number_of_sites
      t.string :overnight_fee
      t.string :season
      t.references :state_forest, foreign_key: true

      t.timestamps
    end
  end
end
