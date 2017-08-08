class RenameColumnBackJoinTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :dive_types_dives, :dive_id, :dife_id
  end
end
