class AddColumnsToDivers < ActiveRecord::Migration[5.1]
  def change
    add_column :divers, :first_name, :string
    add_column :divers, :last_name, :string
    add_column :divers, :certification, :integer, default: 0
    add_column :divers, :metric, :boolean, default: true
  end
end
