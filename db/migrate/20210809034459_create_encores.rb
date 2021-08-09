class CreateEncores < ActiveRecord::Migration[5.2]
  def change
    create_table :encores do |t|
      t.integer :song_id
      t.string :title

      t.timestamps
    end
  end
end
