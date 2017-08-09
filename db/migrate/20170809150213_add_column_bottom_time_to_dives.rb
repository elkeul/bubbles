class AddColumnBottomTimeToDives < ActiveRecord::Migration[5.1]
  def change
    add_column :dives, :bottom_time, :integer, default: 0
  end
end
