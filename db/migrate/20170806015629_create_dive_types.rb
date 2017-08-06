class CreateDiveTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :dive_types do |t|
      t.string :activity

      t.timestamps
    end
    add_index :dive_types, :activity, unique: true
  end
end
