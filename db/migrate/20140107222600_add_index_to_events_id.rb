class AddIndexToEventsId < ActiveRecord::Migration
  def change
    add_index :events, :id, unique: true
  end
end
