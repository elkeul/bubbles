class ChangeColumnsInDives < ActiveRecord::Migration[5.1]
  def change
    remove_column :dives, :decimal
    change_column :dives, :latitude, :decimal, :precision => 5, :scale => 2
    change_column :dives, :longitude, :decimal, :precision => 5, :scale => 2
  end
end
