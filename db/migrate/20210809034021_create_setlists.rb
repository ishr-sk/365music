class CreateSetlists < ActiveRecord::Migration[5.2]
  def change
    create_table :setlists do |t|
      t.string :artist
      t.datetime :date
      t.string :event
      t.text :venue
      t.integer :user_id

      t.timestamps
    end
  end
end
