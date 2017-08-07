class InsertDiverIdIntoDives < ActiveRecord::Migration[5.1]
  def change
    add_reference :dives, :diver, foreign_key: true
  end
end
