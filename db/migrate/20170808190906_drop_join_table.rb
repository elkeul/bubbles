class DropJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :dive_types_dives
  end
end
