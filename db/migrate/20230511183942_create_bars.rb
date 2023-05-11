class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :city
      t.integer :tap_quantity
      t.boolean :overnight_delivery

      t.timestamps
    end
  end
end
