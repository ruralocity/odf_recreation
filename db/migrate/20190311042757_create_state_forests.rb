class CreateStateForests < ActiveRecord::Migration[5.2]
  def change
    create_table :state_forests do |t|
      t.string :name

      t.timestamps
    end
  end
end
