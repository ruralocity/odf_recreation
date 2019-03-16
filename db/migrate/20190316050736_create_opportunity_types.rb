class CreateOpportunityTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :opportunity_types do |t|
      t.references :opportunity, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
