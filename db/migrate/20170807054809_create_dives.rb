class CreateDives < ActiveRecord::Migration[5.1]
  def change
    create_table :dives do |t|
      t.integer :dive_number
      t.date :dive_date
      t.string :location
      t.decimal :latitude, :decimal, :precision => 5, :scale => 2
      t.decimal :longitude, :decimal, :precision => 5, :scale => 2
      t.time :time_in
      t.time :time_out
      t.integer :depth
      t.integer :safety_stop_minutes
      t.integer :pressure_in
      t.integer :pressure_out
      t.integer :temperature_air
      t.integer :temperature_water
      t.string :buddies
      t.text :comments

      t.timestamps
    end
  end
end
