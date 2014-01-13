class CreateRetreatregs < ActiveRecord::Migration
  def change
    create_table :retreatregs do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    add_index :retreatregs, :user_id
    add_index :retreatregs, :event_id
    add_index :retreatregs, [:user_id, :event_id], unique: true
  end
end
