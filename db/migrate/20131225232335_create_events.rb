class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :e_id
      t.string :title
      t.integer :organizer_id
      t.string :venue
      t.string :restrictions
      t.string :tradition
      t.text :description
      t.text :preparations
      t.text :instructions
      t.text :code_conduct
      t.text :comments
      t.string :address_1
      t.string :address_2
      t.string :state
      t.string :zip_code
      t.integer :capacity
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :rating

      t.timestamps
    end
  end
end
