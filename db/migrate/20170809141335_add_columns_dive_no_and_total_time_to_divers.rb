class AddColumnsDiveNoAndTotalTimeToDivers < ActiveRecord::Migration[5.1]
  def change
    add_column :divers, :last_dive_number, :integer, default: 0
    add_column :divers, :total_bottom_time, :integer, default: 0
  end
end
