class CreateKegs < ActiveRecord::Migration[7.0]
  def change
    create_table :kegs do |t|
      t.string :name
      t.string :beer_type
      t.boolean :ordered
      t.integer :abv
      t.integer :ibu
      t.integer :price
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
