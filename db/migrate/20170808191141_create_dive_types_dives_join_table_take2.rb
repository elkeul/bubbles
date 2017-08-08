class CreateDiveTypesDivesJoinTableTake2 < ActiveRecord::Migration[5.1]
  def change
    create_join_table :dive_types, :dives 
  end
end
