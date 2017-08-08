class RenameColumnJoinTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :dive_types_dives, :dife_id, :dive_id
  end
end
