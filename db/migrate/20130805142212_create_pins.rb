class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :name
      t.string :address
      t.decimal :lat, precision: 20, scale: 15
      t.decimal :lng, precision: 20, scale: 15
      t.integer :acc

      t.timestamps
    end
  end
end
