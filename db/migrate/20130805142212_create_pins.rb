class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :name
      t.string :address
      t.decimal :latitude, precision: 20, scale: 15
      t.decimal :longitude, precision: 20, scale: 15
      t.float :accuracy
      t.float :altitude
      t.float :altitude_accuracy
      t.float :heading
      t.float :speed

      t.timestamps
    end
  end
end
